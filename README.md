# Hacker — AdmiraNext Prank

Simula un hackeo estilo Matrix en todos los equipos de AdmiraNext simultaneamente.

## Que hace

1. Lluvia de caracteres Matrix (verde sobre negro)
2. Mensaje "ACCESS GRANTED" con efecto glitch
3. Scroll de comandos falsos de hacking
4. Barras de progreso con frases en ruso o chino (distintas por equipo)
5. Calavera ASCII gigante
6. Mensaje final amenazante trilingue
7. Al pulsar una tecla: "Tranquilo... era broma del equipo AdmiraNext"

## Equipos y mensajes

| Equipo | Idioma | Grupo ficticio |
|---|---|---|
| MacBook Air Nines | Ruso | Krasnaya Zvezda |
| MacBook Pro Negro 14 | Chino | PLA Unit 61398 |
| MacBook Air 16 (DG) | Ruso | Dark Web Coalition |
| Mac Mini | Chino | Shadow Net Strike Force |

## Uso

### Lanzar en todos los equipos desde Mac Mini:

```bash
./launch_remote.sh
```

### Lanzar solo en local:

```bash
./hacker.sh macmini
```

## Requisitos

- macOS con Terminal
- Tailscale con SSH configurado
- curl
