# Proyecto 22 — Hacker

> Simulador de hackeo estilo Matrix para AdmiraNext con controles remoto desde cualquier equipo.

## Contexto
Hacker es un proyecto de broma/demostración que simula un ataque cibernético de ~5 minutos en todos los equipos de AdmiraNext simultáneamente. Se controla con dos teclas (Z para iniciar, Q para parar) desde cualquier máquina conectada a Tailscale. Cada equipo tiene su propio tema visual, idioma ficticio y grupo hacker asignado para diversidad visual.

## Arquitectura
- **controller.sh**: script principal que detecta el equipo local, abre Altadis en todos los equipos, captura pulsaciones Z/Q y orquesta la ejecución remota
- **hacker.sh**: animación del hackeo (27 fases con 4 temas visuales), se descarga automáticamente en cada equipo
- Infraestructura: SSH vía Tailscale (red: tail48b61c.ts.net) entre 4 Macs (MacBook Air Nines, MacBook Pro Negro 14, MacBook Air 16 DG, Mac Mini)
- Altadis se abre en fullscreen antes del hackeo y se restaura al pulsar Q

## Equipos
| Equipo | IP Tailscale | Tema | Idioma | Usuario SSH |
|--------|-------------|------|--------|------------|
| MacBook Air Nines | 100.76.96.50 | Verde Matrix | Ruso | csilvasantin |
| MacBook Pro Negro 14 | 100.101.192.1 | Rojo/ámbar cyberpunk | Chino | csilvasantin |
| MacBook Air 16 (DG) | 100.99.176.126 | Azul/hielo | Ruso | Carlos |
| Mac Mini | 100.74.101.14 | Púrpura/neon | Chino | csilvasantin |

## Notas para IAs
- Cambios futuros requieren bump de versión en controller.sh y push a GitHub
- SSH debe estar habilitado en todos los equipos y las claves públicas preconfiguradas en authorized_keys
- El script captura stdin de forma bloqueante con pulsaciones — no admite piping
- Requisitos: macOS, Terminal, Safari, Tailscale conectado, curl
- Para la demostración en oficina: asegurar que todos los equipos están encendidos, conectados a Tailscale y con Accesibilidad habilitada para Terminal
