#!/bin/bash
# ============================================================
# STOP_REMOTE.SH — Stop hack and close Terminal on all machines
# Run from any machine with SSH access via Tailscale
# ============================================================

GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
DIM='\033[0;37m'
RESET='\033[0m'

SSH_OPTS="-o ConnectTimeout=5 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o BatchMode=yes"

echo ""
echo -e "${RED}  ╔═══════════════════════════════════════════╗${RESET}"
echo -e "${RED}  ║   ADMIRA NEXT — STOPPING HACK ON ALL     ║${RESET}"
echo -e "${RED}  ╚═══════════════════════════════════════════╝${RESET}"
echo ""

declare -a TARGETS=(
  "MacBookAir16|csilvasantin|100.99.176.126"
  "MacBookAirAzul|csilvasantin|100.84.81.45"
  "MacBookAirCrema|csilvasantin|100.110.80.2"
  "MacBookAirBlanco|csilvasantin|100.75.118.75"
  "MacBookAirPlata|csilvasantin|100.114.113.88"
  "MacMini|csilvasantin|100.74.101.14"
  "MacBookProNegro14|csilvasantin|100.101.192.1"
)

TOTAL=${#TARGETS[@]}
COUNT=0

for target in "${TARGETS[@]}"; do
  IFS='|' read -r name user ip <<< "$target"
  COUNT=$((COUNT + 1))
  echo -ne "${YELLOW}  [${COUNT}/${TOTAL}] ${name} (${ip})...${RESET} "

  ssh $SSH_OPTS "${user}@${ip}" "
    pkill -f hack-sim.sh 2>/dev/null
    pkill -f hacker_remote 2>/dev/null
    osascript -e 'tell application \"Terminal\" to quit' 2>/dev/null
    true
  " 2>/dev/null &

  echo -e "${GREEN}STOPPED${RESET}"
  sleep 0.2
done

wait

echo ""
echo -e "${GREEN}  ✓ All machines cleaned${RESET}"
echo ""
