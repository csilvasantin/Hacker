# Proyecto 22 — Hacker

> Simulacion cinematografica de hackeo para los 8 equipos del Consejo de AdmiraNext.

## Contexto
Sistema de demo/broma que simula un ataque cibernetico en todos los equipos simultaneamente. Se lanza remotamente desde cualquier maquina con Tailscale (incluyendo el PC Windows). Cada equipo muestra contenido unico: escena de pelicula, perfil de Terminal, lenguajes de programacion, grupo hacker y velocidad de scroll distintos.

## Arquitectura
- **launch_remote.sh**: Lanzador remoto — detecta maquinas online, sube scripts por descarga de GitHub, lanza hack-open-terminal.sh en cada una
- **hack-sim.sh** (en repo AdmiraNext-Team/ops): Script principal con 7 fases cinematograficas + loop infinito de 135 citas sci-fi
- **hack-open-terminal.sh** (en repo AdmiraNext-Team/ops): Abre Terminal con perfil macOS unico por consejero (Homebrew, Red Sands, Ocean, Pro, Novel, Silver Aerogel, Grass, Man Page)
- **modem-sound.py** (en repo AdmiraNext-Team/ops): Genera sonido de modem 56k con 8 perfiles de frecuencia distintos
- **controller.sh**: Controlador legacy con teclas Z/Q (no usa el sistema nuevo)
- Infraestructura: SSH via Tailscale (red: tail48b61c.ts.net) a 8 Macs

## Equipos
| Equipo | IP Tailscale | Seed | Terminal | Escena | Lenguajes | IA | Velocidad |
|--------|-------------|------|----------|--------|-----------|-----|-----------|
| MacBook Air 16 (CEO) | 100.99.176.126 | 0 | Homebrew | WarGames | ASM+Pascal | PyTorch | 0.01s |
| MacBook Pro Negro 14 (CTO) | 100.101.192.1 | 1 | Red Sands | 2001 | C+JS | TensorFlow | 0.02s |
| MacBook Air Plata (COO) | 100.114.113.88 | 2 | Ocean | Terminator | C+++Lingo | LangChain | 0.03s |
| Mac Mini (CFO) | 100.74.101.14 | 3 | Pro | Blade Runner | Pascal+ASM | Scikit-learn | 0.04s |
| MacBook Air Blanco (CCO) | 100.75.118.75 | 4 | Novel | Alien | JS+C | PyTorch | 0.05s |
| MacBook Air Azul (CDO) | 100.84.81.45 | 5 | Silver Aerogel | Star Wars | Lingo+C++ | TensorFlow | 0.06s |
| AdmiraTwin PC (CXO) | 100.121.18.12 | 6 | Grass | Matrix | ASM+Pascal | LangChain | 0.07s |
| MacBook Air Crema (CSO) | 100.110.80.2 | 7 | Man Page | Tron | C+JS | Scikit-learn | 0.08s |
| DGX Spark (Linux, GPU) | 100.119.58.65 | 6 | Homebrew (gnome-terminal) | Matrix | ASM+Pascal | LangChain | 0.07s |

## Nodos Linux (DGX Spark, ThinkStation…)
- Usuario SSH del DGX Spark = **bitsatoms** (no csilvasantin). SSH directo funciona (Tailscale SSH en `accept`).
- El opener macOS (Terminal.app/osascript) NO vale en Linux → **hack-open-terminal-linux.sh**: descubre el entorno de la sesión gráfica (DISPLAY/XAUTHORITY/DBUS del proceso gnome-shell), abre `gnome-terminal --full-screen` y lo trae al frente con wmctrl/xdotool (fullscreen+above+activate) con un keeper acotado (~8 s).
- **Look & feel = perfil «Homebrew»** (verde sobre negro), equivalente al perfil de Terminal.app del opener macOS. El opener lo crea por dconf (idempotente) y lanza con `--profile=Homebrew`. OJO: `dconf read/write` necesita `DBUS_SESSION_BUS_ADDRESS` exportado (si no: «Cannot autolaunch D-Bus without X11 $DISPLAY» y devuelve vacío) — al verificar por SSH, exportar DISPLAY+XAUTHORITY+DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1001/bus.
- `launch_remote.sh` elige opener por `uname` remoto (Darwin vs Linux) y sube también modem-sound.py (ahora cae a aplay/paplay en Linux).
- hack-sim.sh: el HARDWARE FINGERPRINT es cross-platform (Linux lee /proc & sysfs → Model, Chip, Cores, RAM, OS reales).
- OJO kiosco: el DGX tiene autostart `~/kiosk-dashboard.sh` (Chromium --kiosk a localhost:11000) y a veces una sesión de navegador viva; compiten por el foreground. Para una toma sostenida del hackeo, pausar antes el kiosco.

## Notas para IAs
- **El repo de ops (antes AdmiraNext-Team) es PRIVADO** (renombrado a 03.-ControlCodexClaude): raw.githubusercontent da 404. Por eso launch_remote.sh ENTREGA POR SCP desde una copia local de ops/ (con fallback a curl si el repo vuelve a ser público). Actualizar los raw URLs si cambia el nombre/visibilidad.
- launch_remote.sh (variante curl heredada) descarga scripts de GitHub raw — puede haber cache de hasta 5 min. Si necesitas la version inmediata, usar SCP directo
- Las claves SSH del PC Windows (admiratwin-windows) y del Mac Mini estan configuradas en todos los Macs
- El ancho de terminal (COLS) no se detecta bien por SSH — el script usa osascript para leer el ancho real de la ventana de Terminal, con fallback a 200
- Cada maquina recibe un ART_SEED (0-7) como tercer argumento que determina todo el contenido unico
- Lingo de Macromedia Director siempre aparece como columna central (amarillo) en todas las maquinas
- La columna de IA muestra PyTorch, TensorFlow, LangChain o Scikit-learn segun el seed
- Para fullscreen necesita permisos de Accesibilidad para Terminal en cada Mac
- 135 citas de peliculas sci-fi del siglo XX (Matrix, Terminator, Star Wars, Blade Runner, Alien, Tron, WarGames, 2001, Hackers, Sneakers, Fifth Element, Hitchhiker's Guide, etc.)
