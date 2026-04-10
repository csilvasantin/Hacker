# Hacker — AdmiraNext Council Hack Simulation

Simulacion cinematografica de hackeo en los 8 equipos del Consejo de AdmiraNext. Se lanza remotamente desde cualquier maquina con Tailscale (PC Windows, Mac, etc.) sin necesidad de acceso fisico.

## Lanzamiento rapido

```bash
# Desde cualquier maquina con SSH y Tailscale:
bash launch_remote.sh
```

Auto-detecta que maquinas estan online y lanza en todas las disponibles.

## Que hace el show

### Fases cinematograficas (~3-4 minutos)

1. **Escena de pelicula** — Arte ASCII de una escena iconica (WOPR de WarGames, HAL 9000, Terminator T-800, Blade Runner, Nostromo de Alien, Death Star, The Matrix, Tron Grid)
2. **Hardware Fingerprint** — Lee datos REALES del equipo (Model, Chip, Serial, UUID, WiFi, macOS version) y los muestra en un panel
3. **Exploit Framework** — Barras de progreso cargando modulos (rootkit, payload, C2 beacon...)
4. **Network Topology** — Mapa ASCII de los 8 consejeros con IPs reales, marca "YOU ARE HERE"
5. **Data Exfiltration** — Barras de progreso por base de datos + tabla de archivos sensibles
6. **Persistence** — Panel de movimiento lateral y backdoor instalado
7. **Loop infinito** — Rota entre 135 citas de peliculas sci-fi y 12 ASCII arts, con transiciones de codigo en 6 columnas

### Lluvia de codigo (transiciones)

Entre cada fase, la pantalla se llena con 6 columnas de codigo real en colores distintos:

| Color | Columna | Ejemplo |
|-------|---------|---------|
| Verde | Lenguaje clasico 1 | Assembly, C, C++, Pascal, JavaScript |
| Cyan | Lenguaje clasico 2 | (otro del grupo anterior) |
| Amarillo | Lingo | Macromedia Director (1988-2017) |
| Magenta | Lenguaje moderno | Rust, Go, Swift, Kotlin, TypeScript, Zig, Python, Ruby |
| Blanco | IA/ML | PyTorch, TensorFlow, LangChain, Scikit-learn |
| Rojo | Machine Code | Opcodes x86-64 |

Cabecera con nombre del lenguaje, creador y ano de creacion.

### Velocidad diferente por maquina

| Consejero | Velocidad |
|-----------|-----------|
| CEO (Steve Jobs) | 0.01s — mas rapido |
| CTO (Steve Wozniak) | 0.02s |
| COO (Tim Cook) | 0.03s |
| CFO (Warren Buffett) | 0.04s |
| CCO (Walt Disney) | 0.05s |
| CDO (Dieter Rams) | 0.06s |
| CXO (Howard Schultz) | 0.07s |
| CSO (George Lucas) | 0.08s — mas lento |

### Audio

Sonido de modem 56k al inicio, con variacion de frecuencia por maquina (8 perfiles distintos).

## Consejo → Maquinas → Perfiles

| Silla | Leyenda | Maquina | IP Tailscale | Terminal Profile | Escena pelicula |
|-------|---------|---------|-------------|-----------------|-----------------|
| CEO | Steve Jobs | MacBook Air 16 | 100.99.176.126 | Homebrew | WarGames (WOPR) |
| CTO | Steve Wozniak | MacBook Pro Negro 14 | 100.101.192.1 | Red Sands | 2001 (HAL 9000) |
| COO | Tim Cook | MacBook Air Plata | 100.114.113.88 | Ocean | Terminator (T-800) |
| CFO | Warren Buffett | Mac Mini | 100.74.101.14 | Pro | Blade Runner |
| CCO | Walt Disney | MacBook Air Blanco | 100.75.118.75 | Novel | Alien (Nostromo) |
| CDO | Dieter Rams | MacBook Air Azul | 100.84.81.45 | Silver Aerogel | Star Wars (Death Star) |
| CXO | Howard Schultz | AdmiraTwin (PC) | 100.121.18.12 | Grass | The Matrix |
| CSO | George Lucas | MacBook Air Crema | 100.110.80.2 | Man Page | Tron (Grid) |

## Archivos

| Archivo | Repo | Descripcion |
|---------|------|-------------|
| `launch_remote.sh` | Hacker | Lanzador remoto — detecta online, sube scripts, lanza |
| `hack-sim.sh` | AdmiraNext-Team/ops | Script principal de la simulacion |
| `hack-open-terminal.sh` | AdmiraNext-Team/ops | Abre Terminal con perfil unico por maquina |
| `modem-sound.py` | AdmiraNext-Team/ops | Genera sonido de modem con variacion por seed |
| `controller.sh` | Hacker | Controlador legacy con teclas Z/Q |

## Requisitos

- macOS con Terminal
- Tailscale instalado y conectado (red: tail48b61c.ts.net)
- SSH habilitado con claves configuradas
- Permisos de Accesibilidad para Terminal (para fullscreen)

## SSH — Configuracion

Clave publica del PC Windows (AdmiraTwin) en `~/.ssh/authorized_keys` de cada Mac:
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMq4yq+lHxOZj00VR/zJJZOifMGUps3bUZigIs/oYcNH admiratwin-windows
```

Clave publica del Mac Mini tambien configurada en todos.

## Preparacion para demo

1. Verificar equipos online: `tailscale status`
2. Ejecutar: `bash launch_remote.sh`
3. Esperar a que todos muestren LAUNCHED
4. Para parar: las maquinas quedan en loop de citas — cerrar Terminal o matar proceso

## Troubleshooting

- **No se pone fullscreen**: Activar Accesibilidad para Terminal en Ajustes > Privacidad > Accesibilidad
- **Script viejo cacheado**: Los scripts se suben por SCP directo o se descargan de GitHub. Si GitHub sirve version vieja, usar SCP
- **Un equipo no responde**: Verificar `tailscale status` y SSH con `ssh csilvasantin@<IP> "echo ok"`
- **SSH rechazado**: Anadir clave publica a `~/.ssh/authorized_keys` del Mac
