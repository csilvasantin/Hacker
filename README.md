# Hacker — AdmiraNext Prank v8

Simula un hackeo estilo Matrix en todos los equipos de AdmiraNext simultaneamente, controlado con dos teclas desde cualquier ordenador.

## Lanzamiento rapido (copiar y pegar en Terminal)

```bash
curl -sL https://raw.githubusercontent.com/csilvasantin/Hacker/main/controller.sh -o /tmp/controller.sh && chmod +x /tmp/controller.sh && /tmp/controller.sh
```

Esto funciona desde **cualquier equipo** del grupo AdmiraNext. Auto-detecta en que maquina estas.

## Controles

| Tecla | Accion |
|---|---|
| **Z** | Abre Altadis en todos → lanza el hackeo en los 4 equipos |
| **Q** | Mata el hackeo en todos y restaura Altadis a pantalla completa |

## Que hace el show (~5 minutos)

### 27 fases con 4 temas visuales distintos

1. Sonido de modem 56k de los noventa
2. Lluvia de caracteres Matrix (diferentes por equipo)
3. "ACCESS GRANTED" con efecto glitch
4. 10 ASCII arts: calavera, poop, smiley, corazon/besos, fantasma, diablo, bomba, arana, alien, pirata
5. Boot sequence de exploit framework
6. Escaneo de redes con ping, traceroute, netstat
7. Graficos ASCII de topologia de red (4 tipos)
8. Crackeo de passwords estilo hashcat
9. Descifrado de archivos AES-256
10. Activacion de camara, micro, sensores
11. Exfiltracion de datos por TOR/DNS tunnel
12. Ransomware cifrando archivos
13. Mensajes en ruso, chino y finlandes con emojis
14. Calavera final + mensaje de rescate en BTC
15. Al pulsar tecla: "Tranquilo... era broma del equipo AdmiraNext"

### Texto sin parar

Despues de cada dibujo ASCII hay una rafaga de texto multilingue para que la pantalla **nunca quede vacia ni negra**.

## Equipos y temas

| Equipo | SSH User | Tailscale IP | Tema | Idioma | Grupo ficticio |
|---|---|---|---|---|---|
| MacBook Air Nines | csilvasantin | 100.76.96.50 | Verde Matrix clasico | Ruso | Krasnaya Zvezda (GRU) |
| MacBook Pro Negro 14 | csilvasantin | 100.101.192.1 | Rojo/ambar cyberpunk | Chino | PLA Unit 61398 (APT1) |
| MacBook Air 16 (DG) | Carlos | 100.99.176.126 | Azul/hielo frio | Ruso | FSB Frozen Bear |
| Mac Mini | csilvasantin | 100.74.101.14 | Purpura/neon darknet | Chino | Shadow Net Zero Day |

## Archivos

| Archivo | Descripcion |
|---|---|
| `controller.sh` | Controlador central — ejecutar desde cualquier equipo |
| `hacker.sh` | Animacion del hackeo (se descarga automaticamente) |
| `launch_remote.sh` | Lanzador legacy (sin Altadis ni controles Z/Q) |

## Requisitos

- macOS con Terminal y Safari
- Tailscale instalado y conectado (red: tail48b61c.ts.net)
- SSH habilitado entre equipos (claves ya configuradas)
- curl (preinstalado en macOS)

## SSH — Configuracion actual

Todos los equipos tienen la clave publica del Mac Mini en `~/.ssh/authorized_keys`.

Conexion desde cualquier equipo a otro:
```bash
# Via Tailscale proxy (para hostnames)
ssh -o ProxyCommand="tailscale nc %h %p" csilvasantin@macbookairnines

# Via IP directa (para macbookair16)
ssh Carlos@100.99.176.126
```

## Preparacion para demo en oficina

1. Asegurate de que todos los equipos estan encendidos y conectados a Tailscale
2. Verifica con `tailscale status` que aparecen online
3. Abre Terminal en cualquiera de los equipos
4. Pega el comando de lanzamiento rapido (arriba)
5. Pulsa **Z** cuando estes listo para el show
6. Pulsa **Q** para parar y dejar Altadis en pantalla

## Troubleshooting

- **No detecta mi equipo**: El controller preguntara manualmente
- **Un equipo no responde**: Verificar que Tailscale esta activo (`tailscale status`)
- **SSH rechazado**: Verificar Remote Login activo en Preferencias del Sistema
- **No se pone fullscreen**: Dar permisos de Accesibilidad a Terminal en Ajustes > Privacidad
