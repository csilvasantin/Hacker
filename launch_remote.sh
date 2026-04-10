#!/bin/bash
# ============================================================
# LAUNCH_REMOTE.SH — Deploy hacker prank to all AdmiraNext machines
# Run from any machine with SSH access via Tailscale (PC, Mac Mini, etc.)
# Each machine opens Terminal with a unique profile style.
# ============================================================

GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
DIM='\033[0;37m'
RESET='\033[0m'

SSH_OPTS="-o ConnectTimeout=5 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o BatchMode=yes"

echo ""
echo -e "${RED}  ╔═══════════════════════════════════════════╗${RESET}"
echo -e "${RED}  ║   ADMIRA NEXT — HACKER PRANK LAUNCHER     ║${RESET}"
echo -e "${RED}  ╚═══════════════════════════════════════════╝${RESET}"
echo ""

# All council machines: name|ssh_user|ip_tailscale|machine_id
declare -a TARGETS=(
  "MacBookAir16|csilvasantin|100.99.176.126|macbookair16"
  "MacBookAirAzul|csilvasantin|100.84.81.45|macbookairazul"
  "MacBookAirCrema|csilvasantin|100.110.80.2|macbookaircrema"
  "MacBookAirBlanco|csilvasantin|100.75.118.75|macbookairblanco"
  "MacBookAirPlata|csilvasantin|100.114.113.88|macbookairplata"
  "MacMini|csilvasantin|100.74.101.14|macmini"
  "MacBookProNegro14|csilvasantin|100.101.192.1|macbookpronegro14"
)

SCRIPT_URL="https://raw.githubusercontent.com/csilvasantin/Hacker/main/hacker.sh"
OPENER_URL="https://raw.githubusercontent.com/csilvasantin/AdmiraNext-Team/main/ops/hack-open-terminal.sh"

TOTAL=${#TARGETS[@]}
COUNT=0
OK=0
FAIL=0

for target in "${TARGETS[@]}"; do
  IFS='|' read -r name user ip machine_id <<< "$target"
  COUNT=$((COUNT + 1))
  echo -ne "${YELLOW}  [${COUNT}/${TOTAL}] ${name} (${ip})...${RESET} "

  # Check if reachable
  if ! ssh $SSH_OPTS "${user}@${ip}" "echo ok" &>/dev/null; then
    echo -e "${DIM}offline${RESET}"
    FAIL=$((FAIL + 1))
    continue
  fi

  # Upload hack script + opener, then launch with unique Terminal profile
  ssh $SSH_OPTS "${user}@${ip}" "
    curl -sL '${SCRIPT_URL}' -o /tmp/hack-sim.sh && chmod +x /tmp/hack-sim.sh
    curl -sL '${OPENER_URL}' -o /tmp/hack-open-terminal.sh && chmod +x /tmp/hack-open-terminal.sh
    bash /tmp/hack-open-terminal.sh '${machine_id}' '${ip}'
  " 2>/dev/null &

  echo -e "${GREEN}LAUNCHED${RESET}"
  OK=$((OK + 1))
  sleep 0.3
done

wait

echo ""
echo -e "${RED}  ✓ Deployed: ${OK}/${TOTAL} machines (${FAIL} offline)${RESET}"
echo -e "${YELLOW}  (Press any key on each machine to stop)${RESET}"
echo ""
