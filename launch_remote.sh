#!/bin/bash
# ============================================================
# LAUNCH_REMOTE.SH — Deploy hacker prank to all AdmiraNext machines
# Run from Mac Mini (hub central)
# ============================================================

GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'

echo ""
echo -e "${RED}  ╔═══════════════════════════════════════════╗${RESET}"
echo -e "${RED}  ║   ADMIRA NEXT — HACKER PRANK LAUNCHER     ║${RESET}"
echo -e "${RED}  ╚═══════════════════════════════════════════╝${RESET}"
echo ""

# Define targets: name, ssh_user, ssh_host, machine_id
declare -a TARGETS=(
  "MacBook Air Nines|csilvasantin|macbookairnines|macbookairnines"
  "MacBook Pro Negro 14|csilvasantin|macbookpronegro14|macbookpronegro14"
  "MacBook Air 16 (DG)|Carlos|100.99.176.126|macbookair16"
)

SCRIPT_URL="https://raw.githubusercontent.com/csilvasantin/Hacker/main/hacker.sh"

# Launch locally on this Mac Mini first
echo -e "${YELLOW}  [0/4] Launching locally on Mac Mini...${RESET}"
curl -sL "$SCRIPT_URL" -o /tmp/hacker_local.sh && chmod +x /tmp/hacker_local.sh
osascript -e '
tell application "Terminal"
  activate
  set newTab to do script "clear && /tmp/hacker_local.sh macmini"
  delay 0.5
  tell front window
    set bounds to {0, 0, 2560, 1600}
  end tell
  delay 0.3
  tell application "System Events" to tell process "Terminal"
    set frontmost to true
    keystroke "f" using {control down, command down}
  end tell
end tell' 2>/dev/null &

sleep 1

# Launch on each remote target
COUNT=1
for target in "${TARGETS[@]}"; do
  IFS='|' read -r name user host machine_id <<< "$target"
  echo -e "${GREEN}  [${COUNT}/4] Deploying to ${name} (${host})...${RESET}"

  # Upload script and launch fullscreen Terminal via SSH
  ssh -o ConnectTimeout=5 \
      -o StrictHostKeyChecking=accept-new \
      -o ProxyCommand="tailscale nc %h %p" \
      "${user}@${host}" "
    curl -sL '${SCRIPT_URL}' -o /tmp/hacker_remote.sh && chmod +x /tmp/hacker_remote.sh
    osascript -e '
    tell application \"Terminal\"
      activate
      set newTab to do script \"clear && /tmp/hacker_remote.sh ${machine_id}\"
      delay 0.5
      tell front window
        set bounds to {0, 0, 2560, 1600}
      end tell
      delay 0.3
      tell application \"System Events\" to tell process \"Terminal\"
        set frontmost to true
        keystroke \"f\" using {control down, command down}
      end tell
    end tell'
  " 2>/dev/null &

  COUNT=$((COUNT + 1))
  sleep 0.5
done

wait

echo ""
echo -e "${RED}  ✓ Prank deployed to all machines!${RESET}"
echo -e "${YELLOW}  (They'll see the cleanup message when they press a key)${RESET}"
echo ""
