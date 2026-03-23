#!/bin/bash
# ============================================================
# CONTROLLER.SH — Coordina el hackeo en todos los equipos
# Se puede ejecutar desde CUALQUIER equipo AdmiraNext
# Auto-detecta en qué máquina estás
#
# Z = Lanzar hackeo en todos
# Q = Matar hackeo en todos y restaurar Altadis
# ============================================================

GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
DIM='\033[2m'
RESET='\033[0m'

SCRIPT_URL="https://raw.githubusercontent.com/csilvasantin/Hacker/main/hacker.sh"

# ---- Auto-detect current machine ----
HOSTNAME_SHORT=$(hostname -s 2>/dev/null || hostname)
TS_NAME=$(tailscale status --self --json 2>/dev/null | grep -o '"HostName":"[^"]*"' | cut -d'"' -f4 | tr '[:upper:]' '[:lower:]' 2>/dev/null)

# Normalize
detect_me() {
  case "${TS_NAME:-$HOSTNAME_SHORT}" in
    *macbookairnines*|*nines*)   echo "macbookairnines" ;;
    *macbookpronegro*|*negro*)   echo "macbookpronegro14" ;;
    *macbookair16*|*air16*)      echo "macbookair16" ;;
    *macmini*|*mac-mini*|*mini*) echo "macmini" ;;
    *) echo "unknown" ;;
  esac
}

ME=$(detect_me)

# If auto-detect fails, ask
if [[ "$ME" == "unknown" ]]; then
  echo -e "${YELLOW}  No he podido detectar en qué equipo estás.${RESET}"
  echo -e "${YELLOW}  Selecciona:${RESET}"
  echo "    1) macbookairnines"
  echo "    2) macbookpronegro14"
  echo "    3) macbookair16"
  echo "    4) macmini"
  read -n 1 -s choice
  case "$choice" in
    1) ME="macbookairnines" ;;
    2) ME="macbookpronegro14" ;;
    3) ME="macbookair16" ;;
    4) ME="macmini" ;;
    *) ME="macbookairnines" ;;
  esac
fi

echo -e "${GREEN}  Detectado: ${ME}${RESET}"

# ---- All machines ----
# Format: ID|USER|HOST|DISPLAY_NAME
ALL_MACHINES=(
  "macbookairnines|csilvasantin|macbookairnines|MacBook Air Nines 🟢"
  "macbookpronegro14|csilvasantin|macbookpronegro14|MacBook Pro Negro 🔴"
  "macbookair16|Carlos|100.99.176.126|MacBook Air 16 (DG) 🔵"
  "macmini|csilvasantin|macmini|Mac Mini 🟣"
)

# ---- Helper: run command on a machine ----
run_on() {
  local mid="$1" user="$2" host="$3"
  shift 3
  local cmd="$*"

  if [[ "$mid" == "$ME" ]]; then
    # Local
    eval "$cmd" 2>/dev/null
  else
    # Remote via Tailscale SSH
    if [[ "$host" =~ ^[0-9] ]]; then
      # IP address — direct SSH
      ssh -o ConnectTimeout=8 -o StrictHostKeyChecking=accept-new "${user}@${host}" "$cmd" 2>/dev/null
    else
      # Hostname — use Tailscale proxy
      ssh -o ConnectTimeout=8 -o StrictHostKeyChecking=accept-new -o ProxyCommand="tailscale nc %h %p" "${user}@${host}" "$cmd" 2>/dev/null
    fi
  fi
}

# ---- Open Altadis fullscreen on one machine ----
open_altadis() {
  local mid="$1" user="$2" host="$3" name="$4"
  echo -e "  ${CYAN}[ALTADIS]${RESET} ${name}..."
  run_on "$mid" "$user" "$host" "osascript -e '
tell application \"Safari\"
  activate
  open location \"https://www.altadis.com\"
  delay 2
  tell application \"System Events\" to tell process \"Safari\"
    set frontmost to true
    keystroke \"f\" using {control down, command down}
  end tell
end tell'" &
}

# ---- Launch hack on one machine ----
launch_hack() {
  local mid="$1" user="$2" host="$3" name="$4"
  echo -e "  ${RED}[HACK]${RESET} ${name}..."
  run_on "$mid" "$user" "$host" "
    curl -sL '${SCRIPT_URL}' -o /tmp/hacker_latest.sh && chmod +x /tmp/hacker_latest.sh
    osascript -e '
    tell application \"Terminal\"
      activate
      do script \"clear && /tmp/hacker_latest.sh ${mid}\"
      delay 0.5
      tell application \"System Events\" to tell process \"Terminal\"
        set frontmost to true
        keystroke \"f\" using {control down, command down}
      end tell
    end tell'" &
}

# ---- Kill hack and restore Altadis on one machine ----
kill_hack() {
  local mid="$1" user="$2" host="$3" name="$4"
  echo -e "  ${YELLOW}[STOP]${RESET} ${name}..."
  run_on "$mid" "$user" "$host" "
    pkill -f hacker_latest 2>/dev/null
    pkill -f hacker_v 2>/dev/null
    pkill -f 'hacker.sh' 2>/dev/null
    sleep 0.5
    osascript -e '
    tell application \"Terminal\"
      close (every window whose name contains \"hacker\") saving no
    end tell' 2>/dev/null
    osascript -e '
    tell application \"Terminal\"
      close (every window whose name contains \"clear\") saving no
    end tell' 2>/dev/null
    sleep 0.3
    osascript -e '
    tell application \"Safari\"
      activate
      open location \"https://www.altadis.com\"
      delay 1.5
      tell application \"System Events\" to tell process \"Safari\"
        set frontmost to true
        keystroke \"f\" using {control down, command down}
      end tell
    end tell'" &
}

# ---- Run action on all machines ----
all_machines_do() {
  local action="$1"
  for machine in "${ALL_MACHINES[@]}"; do
    IFS='|' read -r mid user host name <<< "$machine"
    case "$action" in
      altadis)   open_altadis "$mid" "$user" "$host" "$name" ;;
      hack)      launch_hack "$mid" "$user" "$host" "$name" ;;
      kill)      kill_hack "$mid" "$user" "$host" "$name" ;;
    esac
  done
  wait
}

# ============================================================
# MAIN
# ============================================================

clear
echo ""
echo -e "${RED}  ╔═══════════════════════════════════════════════════════╗${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ║   💀 ADMIRA NEXT — HACKER CONTROLLER 💀               ║${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ║   Ejecutando desde: ${GREEN}${ME}${RED}                    ║${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ║   Equipos:                                            ║${RESET}"
for machine in "${ALL_MACHINES[@]}"; do
  IFS='|' read -r mid user host name <<< "$machine"
  if [[ "$mid" == "$ME" ]]; then
    echo -e "${RED}  ║     ${name} ${YELLOW}← TÚ${RED}          ║${RESET}"
  else
    echo -e "${RED}  ║     ${name}                        ║${RESET}"
  fi
done
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ╚═══════════════════════════════════════════════════════╝${RESET}"
echo ""

# ---- Step 1: Open Altadis on all ----
echo -e "${CYAN}  ▶ Abriendo Altadis en todos los equipos...${RESET}"
echo ""
all_machines_do altadis
echo ""
echo -e "${GREEN}  ✓ Altadis abierto en todos los equipos${RESET}"
echo ""
echo -e "${RED}  ╔═══════════════════════════════════════════════════════╗${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ║   Pulsa ${YELLOW}Z${RED} → lanzar HACKEO en todos los equipos       ║${RESET}"
echo -e "${RED}  ║   Pulsa ${YELLOW}Q${RED} → salir sin hackear                         ║${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ╚═══════════════════════════════════════════════════════╝${RESET}"
echo ""

# ---- Wait for Z or Q ----
while true; do
  read -n 1 -s key
  case "$key" in
    z|Z) echo -e "\n${RED}  💀💀💀 LANZANDO HACKEO EN TODOS LOS EQUIPOS 💀💀💀${RESET}\n"; break ;;
    q|Q) echo -e "\n${YELLOW}  Saliendo. Altadis sigue abierto.${RESET}\n"; exit 0 ;;
  esac
done

# ---- Step 2: Launch hack on all ----
all_machines_do hack
sleep 2

echo ""
echo -e "${GREEN}  ✓ Hackeo lanzado en todos los equipos${RESET}"
echo ""
echo -e "${RED}  ╔═══════════════════════════════════════════════════════╗${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ║   Pulsa ${YELLOW}Q${RED} → MATAR hackeo y restaurar Altadis         ║${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ╚═══════════════════════════════════════════════════════╝${RESET}"
echo ""

# ---- Wait for Q ----
while true; do
  read -n 1 -s key
  case "$key" in
    q|Q) echo -e "\n${YELLOW}  ⏹ Matando hackeo y restaurando Altadis...${RESET}\n"; break ;;
  esac
done

# ---- Step 3: Kill hack and restore Altadis ----
all_machines_do kill

echo ""
echo -e "${GREEN}  ╔═══════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}  ║                                                       ║${RESET}"
echo -e "${GREEN}  ║   ✅ Hackeo eliminado en todos los equipos            ║${RESET}"
echo -e "${GREEN}  ║   ✅ Altadis restaurado a pantalla completa           ║${RESET}"
echo -e "${GREEN}  ║                                                       ║${RESET}"
echo -e "${GREEN}  ╚═══════════════════════════════════════════════════════╝${RESET}"
echo ""
