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
# OJO: el usuario SSH varía por SO — los Macs entran como csilvasantin; los nodos Linux
# con su usuario local (el DGX Spark es bitsatoms). El opener se elige por `uname` remoto.
declare -a TARGETS=(
  "MacBookAir16|csilvasantin|100.99.176.126|macbookair16"
  "MacBookAirAzul|csilvasantin|100.84.81.45|macbookairazul"
  "MacBookAirCrema|csilvasantin|100.110.80.2|macbookaircrema"
  "MacBookAirBlanco|csilvasantin|100.75.118.75|macbookairblanco"
  "MacBookAirPlata|csilvasantin|100.114.113.88|macbookairplata"
  "MacMini|csilvasantin|100.74.101.14|macmini"
  "MacBookProNegro14|csilvasantin|100.101.192.1|macbookpronegro14"
  "DGXSpark|bitsatoms|100.119.58.65|dgx-spark"
)

# ── Origen de los scripts ──
# El repo de ops (antes AdmiraNext-Team, ahora 03.-ControlCodexClaude) es PRIVADO, así
# que raw.githubusercontent devuelve 404: NO se puede depender de la descarga pública.
# Entregamos por SCP desde una copia local de ops/ (este equipo tiene SSH a toda la flota).
# Si no hay copia local, se intenta curl como último recurso (por si el repo vuelve a ser público).
OPS_CANDIDATES=(
  "$HOME/Documents/New project/csilvasantin-repos/AdmiraNext-Team/ops"
  "$HOME/Documents/New project/csilvasantin-repos/03.-ControlCodexClaude/ops"
  "$HOME/Claude/AdmiraNext-Team/ops"
)
OPS_DIR=""
for _c in "${OPS_CANDIDATES[@]}"; do
  [ -f "$_c/hack-sim.sh" ] && { OPS_DIR="$_c"; break; }
done
RAW_BASE="https://raw.githubusercontent.com/csilvasantin/03.-ControlCodexClaude/main/ops"

if [ -n "$OPS_DIR" ]; then
  echo -e "${DIM}  ops/ local: ${OPS_DIR}${RESET}"
else
  echo -e "${YELLOW}  ⚠ sin copia local de ops/ — intentaré curl (repo privado ⇒ puede fallar)${RESET}"
fi

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

  # Entrega: SCP desde ops/ local (repo privado) con fallback a curl.
  if [ -n "$OPS_DIR" ]; then
    scp $SSH_OPTS -q \
      "$OPS_DIR/hack-sim.sh" "$OPS_DIR/hack-open-terminal.sh" \
      "$OPS_DIR/hack-open-terminal-linux.sh" "$OPS_DIR/modem-sound.py" \
      "${user}@${ip}:/tmp/" 2>/dev/null
    ssh $SSH_OPTS "${user}@${ip}" "
      chmod +x /tmp/hack-sim.sh /tmp/hack-open-terminal.sh /tmp/hack-open-terminal-linux.sh 2>/dev/null
      if [ \"\$(uname -s)\" = 'Linux' ]; then bash /tmp/hack-open-terminal-linux.sh '${machine_id}' '${ip}'
      else bash /tmp/hack-open-terminal.sh '${machine_id}' '${ip}'; fi
    " 2>/dev/null &
  else
    ssh $SSH_OPTS "${user}@${ip}" "
      curl -sL '${RAW_BASE}/hack-sim.sh' -o /tmp/hack-sim.sh && chmod +x /tmp/hack-sim.sh
      curl -sL '${RAW_BASE}/modem-sound.py' -o /tmp/modem-sound.py 2>/dev/null
      if [ \"\$(uname -s)\" = 'Linux' ]; then
        curl -sL '${RAW_BASE}/hack-open-terminal-linux.sh' -o /tmp/hack-open-terminal-linux.sh && chmod +x /tmp/hack-open-terminal-linux.sh
        bash /tmp/hack-open-terminal-linux.sh '${machine_id}' '${ip}'
      else
        curl -sL '${RAW_BASE}/hack-open-terminal.sh' -o /tmp/hack-open-terminal.sh && chmod +x /tmp/hack-open-terminal.sh
        bash /tmp/hack-open-terminal.sh '${machine_id}' '${ip}'
      fi
    " 2>/dev/null &
  fi

  echo -e "${GREEN}LAUNCHED${RESET}"
  OK=$((OK + 1))
  sleep 0.3
done

wait

echo ""
echo -e "${RED}  ✓ Deployed: ${OK}/${TOTAL} machines (${FAIL} offline)${RESET}"
echo -e "${YELLOW}  (Press any key on each machine to stop)${RESET}"
echo ""
