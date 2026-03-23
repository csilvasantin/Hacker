#!/bin/bash
# ============================================================
# CONTROLLER.SH — Coordina el hackeo en todos los equipos
# Ejecutar desde Mac Mini (hub central)
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

# ---- Define machines ----
declare -a NAMES=("macbookairnines" "macbookpronegro14" "macbookair16" "Mac Mini (local)")
declare -a USERS=("csilvasantin" "csilvasantin" "Carlos" "local")
declare -a HOSTS=("macbookairnines" "macbookpronegro14" "100.99.176.126" "local")
declare -a IDS=("macbookairnines" "macbookpronegro14" "macbookair16" "macmini")

# ---- Helper: run command on remote or local ----
run_on() {
  local idx=$1
  shift
  local cmd="$*"
  if [[ "${HOSTS[$idx]}" == "local" ]]; then
    eval "$cmd" 2>/dev/null
  else
    local proxy=""
    # Use ProxyCommand for tailscale hostnames, direct for IPs
    if [[ "${HOSTS[$idx]}" =~ ^[0-9] ]]; then
      ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=accept-new "${USERS[$idx]}@${HOSTS[$idx]}" "$cmd" 2>/dev/null
    else
      ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=accept-new -o ProxyCommand="tailscale nc %h %p" "${USERS[$idx]}@${HOSTS[$idx]}" "$cmd" 2>/dev/null
    fi
  fi
}

# ---- Open Altadis fullscreen on one machine ----
open_altadis() {
  local idx=$1
  echo -e "  ${CYAN}[ALTADIS]${RESET} Abriendo en ${NAMES[$idx]}..."
  run_on $idx "osascript -e '
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
  local idx=$1
  local mid="${IDS[$idx]}"
  echo -e "  ${RED}[HACK]${RESET} Lanzando en ${NAMES[$idx]} (${mid})..."
  run_on $idx "
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

# ---- Kill hack on one machine and restore Altadis ----
kill_hack() {
  local idx=$1
  echo -e "  ${YELLOW}[KILL]${RESET} Matando hack en ${NAMES[$idx]}..."
  run_on $idx "
    pkill -f hacker_latest 2>/dev/null
    pkill -f hacker_v 2>/dev/null
    sleep 0.5
    osascript -e '
    tell application \"Terminal\"
      close (every window whose name contains \"hacker\") saving no
    end tell' 2>/dev/null
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

# ============================================================
# MAIN
# ============================================================

clear
echo ""
echo -e "${RED}  ╔═══════════════════════════════════════════════════════╗${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ║   💀 ADMIRA NEXT — HACKER CONTROLLER 💀               ║${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ║   Equipos:                                            ║${RESET}"
echo -e "${RED}  ║     🟢 macbookairnines    (csilvasantin)              ║${RESET}"
echo -e "${RED}  ║     🔴 macbookpronegro14  (csilvasantin)              ║${RESET}"
echo -e "${RED}  ║     🔵 macbookair16       (Carlos)                    ║${RESET}"
echo -e "${RED}  ║     🟣 Mac Mini           (local)                     ║${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ╚═══════════════════════════════════════════════════════╝${RESET}"
echo ""

# ---- Step 1: Open Altadis on all machines ----
echo -e "${CYAN}  ▶ Abriendo Altadis en todos los equipos...${RESET}"
echo ""
for ((i=0; i<${#NAMES[@]}; i++)); do
  open_altadis $i
done
wait
echo ""
echo -e "${GREEN}  ✓ Altadis abierto en todos los equipos${RESET}"
echo ""
echo -e "${RED}  ╔═══════════════════════════════════════════════════════╗${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ║   Pulsa ${YELLOW}Z${RED} para lanzar el HACKEO en todos              ║${RESET}"
echo -e "${RED}  ║   Pulsa ${YELLOW}Q${RED} para salir sin hackear                      ║${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ╚═══════════════════════════════════════════════════════╝${RESET}"
echo ""

# ---- Wait for Z or Q ----
while true; do
  read -n 1 -s key
  case "$key" in
    z|Z)
      echo -e "\n${RED}  💀💀💀 LANZANDO HACKEO EN TODOS LOS EQUIPOS 💀💀💀${RESET}\n"
      break
      ;;
    q|Q)
      echo -e "\n${YELLOW}  Saliendo sin hackear. Altadis sigue abierto.${RESET}\n"
      exit 0
      ;;
  esac
done

# ---- Step 2: Launch hack on all machines ----
for ((i=0; i<${#NAMES[@]}; i++)); do
  launch_hack $i
done
wait
sleep 2

echo ""
echo -e "${GREEN}  ✓ Hackeo lanzado en todos los equipos${RESET}"
echo ""
echo -e "${RED}  ╔═══════════════════════════════════════════════════════╗${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ║   Pulsa ${YELLOW}Q${RED} para MATAR el hackeo en todos              ║${RESET}"
echo -e "${RED}  ║   y restaurar Altadis a pantalla completa             ║${RESET}"
echo -e "${RED}  ║                                                       ║${RESET}"
echo -e "${RED}  ╚═══════════════════════════════════════════════════════╝${RESET}"
echo ""

# ---- Wait for Q ----
while true; do
  read -n 1 -s key
  case "$key" in
    q|Q)
      echo -e "\n${YELLOW}  ⏹ Matando hackeo en todos los equipos...${RESET}\n"
      break
      ;;
  esac
done

# ---- Step 3: Kill hack and restore Altadis ----
for ((i=0; i<${#NAMES[@]}; i++)); do
  kill_hack $i
done
wait

echo ""
echo -e "${GREEN}  ╔═══════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}  ║                                                       ║${RESET}"
echo -e "${GREEN}  ║   ✅ Hackeo eliminado en todos los equipos            ║${RESET}"
echo -e "${GREEN}  ║   ✅ Altadis restaurado a pantalla completa           ║${RESET}"
echo -e "${GREEN}  ║                                                       ║${RESET}"
echo -e "${GREEN}  ╚═══════════════════════════════════════════════════════╝${RESET}"
echo ""
