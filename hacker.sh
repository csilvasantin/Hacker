#!/bin/bash
# ============================================================
# HACKER v2 — Matrix hacker prank with modem sound & 5 min show
# Each machine gets a unique visual theme
# AdmiraNext Team · 2026
# Usage: ./hacker.sh [machine_id]
# ============================================================

MACHINE_ID="${1:-$(hostname)}"

# ===================== THEME PER MACHINE =====================
# Each machine gets different colors, title, language, and style

case "$MACHINE_ID" in
  macbookairnines)
    # THEME: Classic Matrix green — Russian military hacker
    C1='\033[0;32m'       # green
    C2='\033[1;32m'       # bright green
    C3='\033[1;37m'       # white flash
    C4='\033[0;32m'       # dim green
    CBORDER='\033[1;32m'
    CALERT='\033[1;31m'
    CBADGE='\033[30;42m'  # black on green
    MATRIX_STYLE="classic"
    HACK_TITLE="КРАСНАЯ ЗВЕЗДА — ГРУППА КИБЕРАТАК"
    HACK_SUB="RUSSIAN FEDERATION CYBER COMMAND — GRU UNIT 74455"
    HACK_ICON="☭"
    PHRASES=(
      "Доступ к системе получен"
      "Загрузка конфиденциальных данных"
      "Шифрование файлов отключено"
      "Брандмауэр полностью обойден"
      "Пароли администратора извлечены"
      "Система полностью скомпрометирована"
      "Передача файлов на сервер ГРУ"
      "Удаленный доступ активирован"
      "Камера наблюдения активирована"
      "Микрофон записывает разговоры"
      "Все данные скопированы на сервер"
      "Банковские реквизиты обнаружены"
      "VPN туннель в Москву открыт"
      "Ваш IP адрес полностью раскрыт"
      "Спасибо за невольное сотрудничество"
    )
    SCAN_NETS=("10.0.0.0/8" "172.16.0.0/12" "192.168.0.0/16" "fc00::/7")
    DECRYPT_FILES=("shadow.db" "keychain.plist" "wallet.dat" "credentials.xml" "secrets.env" "id_rsa" "cookies.sqlite")
    ;;

  macbookpronegro14)
    # THEME: Red/amber cyberpunk — Chinese APT
    C1='\033[0;31m'       # red
    C2='\033[1;31m'       # bright red
    C3='\033[1;33m'       # amber/yellow flash
    C4='\033[0;33m'       # dim amber
    CBORDER='\033[1;31m'
    CALERT='\033[1;33m'
    CBADGE='\033[30;41m'  # black on red
    MATRIX_STYLE="cyberpunk"
    HACK_TITLE="红龙网络战部队 — 第六十一三九八部队"
    HACK_SUB="PEOPLE'S LIBERATION ARMY — UNIT 61398 — APT1"
    HACK_ICON="龍"
    PHRASES=(
      "系统根权限已获取"
      "正在扫描所有磁盘分区"
      "防火墙规则已全部清除"
      "管理员密码已暴力破解"
      "数据库正在完整转储"
      "摄像头画面正在传输"
      "麦克风音频流已开启"
      "银行账户信息已提取"
      "SSL证书已伪造替换"
      "远程控制木马已植入"
      "所有浏览器密码已导出"
      "IP地址定位已完成"
      "后门程序已深度隐藏"
      "键盘记录器全速运行中"
      "任务圆满完成 — 数据已回传北京"
    )
    SCAN_NETS=("192.168.1.0/24" "10.10.0.0/16" "100.64.0.0/10" "fd00::/8")
    DECRYPT_FILES=("master.key" "login.keychain-db" "Cookies.binarycookies" "cert.pem" "token.json" "vault.gpg" "backup.tar.enc")
    ;;

  macbookair16)
    # THEME: Blue/ice cold — Russian intelligence
    C1='\033[0;34m'       # blue
    C2='\033[1;36m'       # bright cyan
    C3='\033[1;37m'       # white flash
    C4='\033[0;36m'       # dim cyan
    CBORDER='\033[1;34m'
    CALERT='\033[1;35m'   # magenta alerts
    CBADGE='\033[37;44m'  # white on blue
    MATRIX_STYLE="ice"
    HACK_TITLE="КОАЛИЦИЯ ТЁМНОЙ СЕТИ — ОТДЕЛ КИБЕРШПИОНАЖА"
    HACK_SUB="FSB SPECIAL CENTER — OPERATION FROZEN BEAR"
    HACK_ICON="❄"
    PHRASES=(
      "Проникновение в сеть завершено"
      "Скачивание секретных документов"
      "Обход двухфакторной аутентификации"
      "Извлечение всех сохраненных паролей"
      "Активация встроенной веб-камеры"
      "Перехват зашифрованных сообщений"
      "Клонирование жесткого диска"
      "Установка невидимого руткита"
      "Глубокое сканирование внутренней сети"
      "Полный доступ к электронной почте"
      "Биометрические данные скопированы"
      "GPS отслеживание устройства активно"
      "Голосовые данные записываются"
      "Криптовалютный кошелёк обнаружен"
      "Операция Frozen Bear завершена успешно"
    )
    SCAN_NETS=("192.168.0.0/24" "172.20.0.0/14" "100.96.0.0/12" "2001:db8::/32")
    DECRYPT_FILES=("iCloud.keychain" "System.keychain" "passwd.enc" "wifi_keys.plist" "vpn_profile.mobileconfig" "ssh_keys.tar" "pgp_private.asc")
    ;;

  macmini|*)
    # THEME: Purple/neon darknet
    C1='\033[0;35m'       # purple
    C2='\033[1;35m'       # bright magenta
    C3='\033[1;32m'       # green flash
    C4='\033[0;35m'       # dim purple
    CBORDER='\033[1;35m'
    CALERT='\033[1;31m'
    CBADGE='\033[37;45m'  # white on purple
    MATRIX_STYLE="darknet"
    HACK_TITLE="暗影网络突击队 — 零日行动"
    HACK_SUB="SHADOW NET STRIKE FORCE — OPERATION ZERO DAY"
    HACK_ICON="暗"
    PHRASES=(
      "零日漏洞链已全部触发"
      "内核级根权限已获取"
      "所有网络端口已完成扫描"
      "SSH私钥已成功窃取"
      "完整数据库已转储完毕"
      "系统管理员令牌已克隆"
      "内部网络已完全渗透"
      "数字证书已伪造成功"
      "DNS解析已完全劫持"
      "系统审计日志已清除"
      "持久化后门已深度植入"
      "勒索加密程序已就绪"
      "比特币钱包已锁定控制"
      "所有关联设备已感染"
      "零日行动完美收官"
    )
    SCAN_NETS=("10.0.0.0/8" "192.168.0.0/16" "100.64.0.0/10" "fe80::/10")
    DECRYPT_FILES=("root.key" "shadow" "krb5.keytab" "tls_private.key" "jwt_secret" "api_tokens.db" "master_password.enc")
    ;;
esac

# ===================== COMMON SETUP =====================
DIM='\033[2m'
BOLD='\033[1m'
RESET='\033[0m'
BG_BLACK='\033[40m'

MATRIX_CHARS_CLASSIC="アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン"
MATRIX_CHARS_CYBER="01@#$%红龙火暗影破解入侵攻击渗透"
MATRIX_CHARS_ICE="▓▒░│┤╡╢╖╕╣║╗╝╜╛┐└┴┬├─┼╞╟╚╔╩╦╠═╬"
MATRIX_CHARS_DARK="⠁⠂⠃⠄⠅⠆⠇⠈⠉⠊⠋⠌⠍⠎⠏⡀⡁⡂⡃⡄⡅⡆⡇⣀⣁⣂⣃⣄⣅⣆⣇"

case "$MATRIX_STYLE" in
  classic)  MATRIX_CHARS="$MATRIX_CHARS_CLASSIC" ;;
  cyberpunk) MATRIX_CHARS="$MATRIX_CHARS_CYBER" ;;
  ice)      MATRIX_CHARS="$MATRIX_CHARS_ICE" ;;
  darknet)  MATRIX_CHARS="$MATRIX_CHARS_DARK" ;;
esac

FAKE_IPS=("185.234.218.42" "91.215.85.17" "103.224.182.250" "45.133.1.81" "194.26.29.113" "77.83.247.99" "5.188.86.114" "212.109.195.33" "223.71.167.82" "116.202.120.166")
FAKE_PORTS=(22 80 443 3306 5432 8080 8443 9090 27017 6379 11211 1433 3389 5900 4444)
FAKE_USERS=("root" "admin" "postgres" "mysql" "www-data" "nobody" "daemon" "operator")
FAKE_HASHES=("5f4dcc3b5aa765d61d8327deb882cf99" "e10adc3949ba59abbe56e057f20f883e" "d8578edf8458ce06fbc5bb76a58c5ca4" "25d55ad283aa400af464c76d713c07ad" "827ccb0eea8a706c4c34a16891f84e7b")

# ===================== FUNCTIONS =====================

get_size() {
  COLS=$(tput cols 2>/dev/null || echo 80)
  ROWS=$(tput lines 2>/dev/null || echo 24)
}

clear_screen() { printf '\033[2J\033[H'; }

hide_cursor() { tput civis 2>/dev/null; }
show_cursor() { tput cnorm 2>/dev/null; }

random_char() {
  local len=${#MATRIX_CHARS}
  if (( len == 0 )); then
    echo -n "X"
    return
  fi
  # Handle multibyte
  local chars=()
  while IFS= read -r -n1 ch; do
    [[ -n "$ch" ]] && chars+=("$ch")
  done <<< "$MATRIX_CHARS"
  if (( ${#chars[@]} == 0 )); then
    echo -n "#"
    return
  fi
  echo -n "${chars[$((RANDOM % ${#chars[@]}))]}"
}

random_ip() { echo "${FAKE_IPS[$((RANDOM % ${#FAKE_IPS[@]}))]}"; }
random_port() { echo "${FAKE_PORTS[$((RANDOM % ${#FAKE_PORTS[@]}))]}"; }
random_user() { echo "${FAKE_USERS[$((RANDOM % ${#FAKE_USERS[@]}))]}"; }
random_hash() { echo "${FAKE_HASHES[$((RANDOM % ${#FAKE_HASHES[@]}))]}"; }
random_hex() { printf '%04x' $((RANDOM % 65536)); }
random_mac() { printf '%02x:%02x:%02x:%02x:%02x:%02x' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)); }
random_pct() { echo "$((RANDOM % 100))"; }

# --- MODEM DIAL-UP SOUND ---
modem_sound() {
  # Generate 56k modem handshake sound using afplay + sox or pure audio
  # Try sox first, fallback to afplay with generated audio, fallback to screen-only
  if command -v sox &>/dev/null; then
    (
      # Dial tone
      sox -n -r 44100 -c 1 -t coreaudio "" synth 0.8 sin 350 sin 440 vol 0.3 2>/dev/null &
      sleep 0.9
      # Ring
      for i in 1 2; do
        sox -n -r 44100 -c 1 -t coreaudio "" synth 0.4 sin 440 sin 480 vol 0.3 2>/dev/null
        sleep 0.3
      done
      # Carrier tones — the iconic screech
      sox -n -r 44100 -c 1 -t coreaudio "" synth 0.5 sin 1070 vol 0.25 2>/dev/null
      sleep 0.1
      sox -n -r 44100 -c 1 -t coreaudio "" synth 0.5 sin 1270 vol 0.25 2>/dev/null
      sleep 0.1
      sox -n -r 44100 -c 1 -t coreaudio "" synth 0.3 sin 2025 sin 2225 vol 0.2 2>/dev/null
      sleep 0.1
      # Training / handshake noise
      sox -n -r 44100 -c 1 -t coreaudio "" synth 1.5 noise band 1800 500 vol 0.15 2>/dev/null
      sleep 0.1
      sox -n -r 44100 -c 1 -t coreaudio "" synth 0.8 sin 1650 sin 1850 vol 0.2 2>/dev/null
      sleep 0.1
      # Final screech
      sox -n -r 44100 -c 1 -t coreaudio "" synth 2.0 noise band 2000 800 vol 0.12 2>/dev/null
    ) &
    MODEM_PID=$!
  else
    # Fallback: generate a WAV file with modem-like tones using pure bash + afplay
    local wav_file="/tmp/modem_$$.wav"
    python3 -c "
import struct, math, wave
sr = 44100
samples = []
def tone(freq, dur, vol=0.3):
    for i in range(int(sr * dur)):
        samples.append(int(vol * 32767 * math.sin(2 * math.pi * freq * i / sr)))
def dual(f1, f2, dur, vol=0.3):
    for i in range(int(sr * dur)):
        samples.append(int(vol * 16383 * (math.sin(2*math.pi*f1*i/sr) + math.sin(2*math.pi*f2*i/sr))))
def noise(dur, vol=0.15):
    import random
    for i in range(int(sr * dur)):
        samples.append(int(vol * 32767 * (random.random() * 2 - 1)))
# Dial tone
dual(350, 440, 0.8)
# Silence
tone(0, 0.2, 0)
# Ring
dual(440, 480, 0.4, 0.3)
tone(0, 0.3, 0)
dual(440, 480, 0.4, 0.3)
tone(0, 0.2, 0)
# Carrier
tone(1070, 0.5, 0.25)
tone(1270, 0.5, 0.25)
dual(2025, 2225, 0.3, 0.2)
# Handshake noise
noise(1.5, 0.15)
dual(1650, 1850, 0.8, 0.2)
# Final screech
noise(2.0, 0.12)
# Write WAV
w = wave.open('$wav_file', 'w')
w.setnchannels(1)
w.setsampwidth(2)
w.setframerate(sr)
w.writeframes(struct.pack('<' + 'h' * len(samples), *samples))
w.close()
" 2>/dev/null
    if [[ -f "$wav_file" ]]; then
      afplay "$wav_file" 2>/dev/null &
      MODEM_PID=$!
    else
      MODEM_PID=0
    fi
  fi
}

# --- MATRIX RAIN ---
matrix_rain() {
  local duration=$1
  local end_time=$((SECONDS + duration))
  get_size
  declare -a drops
  for ((i=0; i<COLS; i++)); do drops[$i]=$((RANDOM % ROWS)); done

  while [[ $SECONDS -lt $end_time ]]; do
    for ((i=0; i<COLS; i+=2)); do
      local row=${drops[$i]}
      printf "\033[${row};${i}H"
      if (( RANDOM % 12 == 0 )); then
        printf "${C3}$(random_char)"
      elif (( RANDOM % 3 == 0 )); then
        printf "${C2}$(random_char)"
      else
        printf "${C1}$(random_char)"
      fi
      local trail=$(( (row - 1 + ROWS) % ROWS ))
      printf "\033[${trail};${i}H${DIM}${C4}$(random_char)"
      local clear_r=$(( (row - 10 + ROWS) % ROWS ))
      printf "\033[${clear_r};${i}H "
      drops[$i]=$(( (row + 1) % ROWS ))
    done
    sleep 0.02
  done
}

# --- GLITCH TEXT ---
glitch_text() {
  local text="$1" iterations=$2
  get_size
  local cx=$(( (COLS - ${#text}) / 2 ))
  local cy=$(( ROWS / 2 ))
  for ((i=0; i<iterations; i++)); do
    local g=""
    for ((c=0; c<${#text}; c++)); do
      if (( RANDOM % 4 == 0 )); then g+="$(random_char)"; else g+="${text:$c:1}"; fi
    done
    # Random offset jitter
    local jx=$(( cx + (RANDOM % 5) - 2 ))
    local jy=$(( cy + (RANDOM % 3) - 1 ))
    printf "\033[${jy};${jx}H${CALERT}${g}${RESET}"
    sleep 0.06
  done
  printf "\033[${cy};${cx}H${CALERT}${BOLD}${text}${RESET}"
}

# --- TYPING EFFECT ---
type_line() {
  local text="$1" color="${2:-$C1}" speed="${3:-0.02}"
  for ((i=0; i<${#text}; i++)); do
    printf "${color}${text:$i:1}"
    sleep "$speed"
  done
  printf "${RESET}\n"
}

# --- PROGRESS BAR ---
progress_bar() {
  local label="$1" width=45
  printf "  ${C2}%-50s${RESET} [" "$label"
  for ((i=0; i<width; i++)); do
    printf "${C2}█"
    sleep 0.02
  done
  printf "${RESET}] ${CALERT}100%%${RESET}\n"
}

# --- FAKE BOOT SEQUENCE ---
boot_sequence() {
  local lines=(
    "BIOS POST... OK"
    "Loading exploit framework v4.7.2-dev"
    "Initializing kernel rootkit module"
    "Mounting encrypted payload partition"
    "Loading network infiltration drivers"
    "Starting covert C2 channel"
    "Bypassing ASLR and DEP protections"
    "Injecting shellcode into memory"
    "Privilege escalation: user -> root"
    "Anti-forensics module loaded"
    "Log cleaner daemon started"
    "Reverse shell listener on port 4444"
    "Connection established to C2 server"
    "Awaiting commands from handler..."
    ">>> SYSTEM FULLY COMPROMISED <<<"
  )
  for line in "${lines[@]}"; do
    printf "  ${DIM}${C1}[$(date +%H:%M:%S)]${RESET} ${C2}${line}${RESET}\n"
    sleep $((RANDOM % 3 == 0 ? 0 : 0))
    sleep 0.15
  done
}

# --- NETWORK SCANNER ---
network_scan() {
  local duration=$1
  local end_time=$((SECONDS + duration))
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${C2}${BOLD} NETWORK RECONNAISSANCE MODULE ${HACK_ICON}${RESET}${CBORDER}                              ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"

  while [[ $SECONDS -lt $end_time ]]; do
    local action=$((RANDOM % 6))
    case $action in
      0) printf "  ${C1}[SCAN]${RESET} ${C4}Probing ${SCAN_NETS[$((RANDOM % ${#SCAN_NETS[@]}))]} ...found $(( RANDOM % 50 + 5 )) hosts${RESET}\n" ;;
      1) printf "  ${C2}[PORT]${RESET} ${C4}$(random_ip):$(random_port) ${C2}OPEN${RESET} ${DIM}${C4}$([ $((RANDOM%2)) -eq 0 ] && echo "SSH-2.0-OpenSSH_9.6" || echo "Apache/2.4.57")${RESET}\n" ;;
      2) printf "  ${CALERT}[VULN]${RESET} ${C4}CVE-2026-$((RANDOM % 9000 + 1000)) found on $(random_ip) — ${C2}EXPLOITABLE${RESET}\n" ;;
      3) printf "  ${C1}[ARP ]${RESET} ${C4}$(random_ip) is at $(random_mac) on eth0${RESET}\n" ;;
      4) printf "  ${C2}[DNS ]${RESET} ${C4}$(random_ip) -> $([ $((RANDOM%3)) -eq 0 ] && echo "mail.target.local" || echo "db-$(random_hex).internal")${RESET}\n" ;;
      5) printf "  ${C1}[SNIF]${RESET} ${C4}Captured packet: $(random_ip):$(random_port) -> $(random_ip):$(random_port) [$(random_hex) $(random_hex) $(random_hex)]${RESET}\n" ;;
    esac
    sleep 0.15
  done
}

# --- PASSWORD CRACKER ---
password_crack() {
  local duration=$1
  local end_time=$((SECONDS + duration))
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${CALERT}${BOLD} PASSWORD CRACKING ENGINE — HASHCAT MODE ${HACK_ICON}${RESET}${CBORDER}                  ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"

  local count=0
  while [[ $SECONDS -lt $end_time ]]; do
    local user=$(random_user)
    local hash=$(random_hash)
    local speed=$((RANDOM % 9000 + 1000))
    if (( RANDOM % 3 == 0 )); then
      local pass_chars="abcdefghijklmnopqrstuvwxyz0123456789!@#"
      local pw=""
      for ((p=0; p<$((RANDOM%6+4)); p++)); do pw+="${pass_chars:$((RANDOM % ${#pass_chars})):1}"; done
      printf "  ${C2}[CRACK]${RESET} ${C4}${user}:${hash:0:16}...${RESET} ${CALERT}>>> ${pw} <<<${RESET} ${DIM}${C4}(${speed} MH/s)${RESET}\n"
      count=$((count + 1))
    else
      printf "  ${C1}[HASH ]${RESET} ${DIM}${C4}${user}:${hash} trying... ${speed} MH/s${RESET}\n"
    fi
    sleep 0.12
  done
  printf "\n  ${CALERT}${BOLD}  ✓ ${count} passwords cracked successfully${RESET}\n"
}

# --- FILE DECRYPTOR ---
decrypt_phase() {
  local duration=$1
  local end_time=$((SECONDS + duration))
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${C2}${BOLD} AES-256 DECRYPTION ENGINE — BRUTE FORCE ${HACK_ICON}${RESET}${CBORDER}                   ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"

  for file in "${DECRYPT_FILES[@]}"; do
    [[ $SECONDS -ge $end_time ]] && break
    printf "  ${C1}[FILE]${RESET} ${C4}/private/var/db/${file}${RESET}\n"
    printf "  ${DIM}${C4}  Key: 0x"
    for ((k=0; k<8; k++)); do
      printf "$(random_hex)"
      sleep 0.08
    done
    printf "${RESET}\n"
    local w=30
    printf "  ${C1}  Decrypting: ["
    for ((i=0; i<w; i++)); do
      printf "${C2}▓"
      sleep 0.04
    done
    printf "${RESET}] ${CALERT}DECRYPTED${RESET}\n"
    printf "  ${C2}  Size: $((RANDOM % 900 + 100))KB — $(random_pct) sensitive records found${RESET}\n\n"
    sleep 0.2
  done
}

# --- DATA EXFILTRATION ---
exfil_phase() {
  local duration=$1
  local end_time=$((SECONDS + duration))
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${CALERT}${BOLD} DATA EXFILTRATION — COVERT CHANNEL ACTIVE ${HACK_ICON}${RESET}${CBORDER}                ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"

  local total=0
  while [[ $SECONDS -lt $end_time ]]; do
    local size=$((RANDOM % 500 + 50))
    total=$((total + size))
    local dst=$(random_ip)
    local proto=$([ $((RANDOM%3)) -eq 0 ] && echo "TOR" || ([ $((RANDOM%2)) -eq 0 ] && echo "DNS-TUNNEL" || echo "HTTPS"))
    printf "  ${C2}[EXFIL]${RESET} ${C4}Uploading ${size}MB via ${proto} -> ${dst}:$(random_port)${RESET}"
    printf " ${DIM}${C4}["
    for ((b=0; b<15; b++)); do printf "="; sleep 0.03; done
    printf "]${RESET} ${CALERT}${size}MB sent${RESET}\n"
    sleep 0.1
  done
  printf "\n  ${CALERT}${BOLD}  ✓ Total exfiltrated: ${total}MB${RESET}\n"
}

# --- WEBCAM / SURVEILLANCE ---
surveillance_phase() {
  local duration=$1
  local end_time=$((SECONDS + duration))
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${CALERT}${BOLD} SURVEILLANCE MODULE — LIVE FEEDS ${HACK_ICON}${RESET}${CBORDER}                           ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"

  local devices=("FaceTime HD Camera" "Built-in Microphone" "Touch ID Sensor" "Ambient Light Sensor" "Location Services" "Bluetooth Scanner" "WiFi Monitor Mode")
  for dev in "${devices[@]}"; do
    [[ $SECONDS -ge $end_time ]] && break
    printf "  ${C1}[INIT]${RESET} ${C4}Accessing: ${dev}...${RESET}"
    sleep 0.4
    printf " ${CALERT}ACTIVE${RESET}\n"
    printf "  ${DIM}${C4}  Stream: rtmp://$(random_ip):1935/live/cam_$(random_hex)${RESET}\n"
    sleep 0.3
  done
  printf "\n  ${CALERT}${BOLD}  ✓ All surveillance feeds active${RESET}\n"
}

# --- RANSOMWARE ANIMATION ---
ransomware_phase() {
  local duration=$1
  local end_time=$((SECONDS + duration))
  printf "\n  ${CALERT}${BOLD}"
  printf "  ╔══════════════════════════════════════════════════════════════╗\n"
  printf "  ║                                                            ║\n"
  printf "  ║   ██╗    ██╗ █████╗ ██████╗ ███╗   ██╗██╗███╗   ██╗██╗    ║\n"
  printf "  ║   ██║    ██║██╔══██╗██╔══██╗████╗  ██║██║████╗  ██║██║    ║\n"
  printf "  ║   ██║ █╗ ██║███████║██████╔╝██╔██╗ ██║██║██╔██╗ ██║██║    ║\n"
  printf "  ║   ██║███╗██║██╔══██║██╔══██╗██║╚██╗██║██║██║╚██╗██║╚═╝    ║\n"
  printf "  ║   ╚███╔███╔╝██║  ██║██║  ██║██║ ╚████║██║██║ ╚████║██╗    ║\n"
  printf "  ║    ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝╚═╝    ║\n"
  printf "  ║                                                            ║\n"
  printf "  ╚══════════════════════════════════════════════════════════════╝\n"
  printf "  ${RESET}\n"

  local exts=(".docx" ".xlsx" ".pdf" ".jpg" ".png" ".psd" ".ai" ".sketch" ".key" ".pages" ".mp4" ".mov" ".zip" ".sql" ".env" ".pem")
  local dirs=("~/Documents" "~/Desktop" "~/Downloads" "~/Pictures" "/var/db" "/etc" "~/Library/Keychains")

  while [[ $SECONDS -lt $end_time ]]; do
    local dir="${dirs[$((RANDOM % ${#dirs[@]}))]}"
    local ext="${exts[$((RANDOM % ${#exts[@]}))]}"
    local fname="$(cat /dev/urandom | LC_ALL=C tr -dc 'a-z' | head -c $((RANDOM%8+4)))${ext}"
    printf "  ${C1}[ENC]${RESET} ${C4}${dir}/${fname}${RESET}"
    printf " ${DIM}${C4}->${RESET} ${CALERT}${fname}.locked${RESET}\n"
    sleep 0.08
  done
}

# --- SKULL ---
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
  get_size
  local start_row=$(( (ROWS - ${#skull[@]}) / 2 - 2 ))
  for ((i=0; i<${#skull[@]}; i++)); do
    local row=$((start_row + i))
    local line="${skull[$i]}"
    local col=$(( (COLS - 55) / 2 ))
    printf "\033[${row};${col}H${CALERT}${line}${RESET}"
    sleep 0.03
  done
}

# --- FINAL WARNING ---
final_warning() {
  get_size
  local cy=$(( ROWS / 2 + 14 ))
  local box=(
    "╔════════════════════════════════════════════════════════════════╗"
    "║                                                              ║"
    "║   ${HACK_ICON}  ALL YOUR DATA BELONGS TO US  ${HACK_ICON}                           ║"
    "║   ВСЕ ВАШИ ДАННЫЕ ПРИНАДЛЕЖАТ НАМ                           ║"
    "║   你所有的数据都属于我们                                       ║"
    "║                                                              ║"
    "║   Machine: ${MACHINE_ID}                                     ║"
    "║   ${HACK_TITLE}  ║"
    "║   Time: $(date '+%Y-%m-%d %H:%M:%S %Z')                     ║"
    "║                                                              ║"
    "║   SEND 2 BTC TO: bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh ║"
    "║   YOU HAVE 48 HOURS                                          ║"
    "║                                                              ║"
    "╚════════════════════════════════════════════════════════════════╝"
  )
  for ((i=0; i<${#box[@]}; i++)); do
    local row=$((cy + i))
    local col=$(( (COLS - 66) / 2 ))
    printf "\033[${row};${col}H${CALERT}${box[$i]}${RESET}"
  done
}

# ========================
# MAIN SHOW — ~5 MINUTES
# ========================

cleanup() {
  show_cursor
  [[ -n "$MODEM_PID" ]] && kill $MODEM_PID 2>/dev/null
  printf "${RESET}\033[0m"
  clear
  echo ""
  echo "  ╔═══════════════════════════════════════════════════╗"
  echo "  ║                                                   ║"
  echo "  ║   Tranquilo... era broma del equipo AdmiraNext    ║"
  echo "  ║                                                   ║"
  echo "  ║   No se ha tocado nada de tu ordenador.           ║"
  echo "  ║   Todo esta exactamente como lo dejaste.          ║"
  echo "  ║                                                   ║"
  echo "  ║   Proyecto: github.com/csilvasantin/Hacker        ║"
  echo "  ║                                                   ║"
  echo "  ╚═══════════════════════════════════════════════════╝"
  echo ""
  echo "  Pulsa cualquier tecla para cerrar."
  read -n 1 -s
}
trap cleanup EXIT

hide_cursor
printf "${BG_BLACK}"
clear_screen

# ---- PHASE 1: Modem dial-up + Matrix rain (15s) ----
modem_sound
matrix_rain 15

# ---- PHASE 2: Glitch ACCESS GRANTED (3s) ----
clear_screen
sleep 0.3
glitch_text ">>> ACCESS GRANTED <<<" 20
sleep 1.5

# ---- PHASE 3: Boot sequence (8s) ----
clear_screen
printf "\n"
printf "  ${CALERT}${BOLD}[!] ROOT ACCESS OBTAINED — ${MACHINE_ID}${RESET}\n"
printf "  ${CBORDER}${BOLD}${HACK_TITLE}${RESET}\n"
printf "  ${DIM}${C4}${HACK_SUB}${RESET}\n"
printf "  ${DIM}${C1}════════════════════════════════════════════════════════════${RESET}\n\n"
boot_sequence
sleep 1

# ---- PHASE 4: Network scan (45s) ----
clear_screen
printf "\n"
network_scan 45

# ---- PHASE 5: Password cracking (40s) ----
clear_screen
printf "\n"
password_crack 40

# ---- PHASE 6: Decryption (35s) ----
clear_screen
printf "\n"
decrypt_phase 35

# ---- PHASE 7: Surveillance (20s) ----
clear_screen
printf "\n"
surveillance_phase 20

# ---- PHASE 8: Data exfiltration (40s) ----
clear_screen
printf "\n"
exfil_phase 40

# ---- PHASE 9: Ransomware (30s) ----
clear_screen
printf "\n"
ransomware_phase 30

# ---- PHASE 10: Matrix rain again (10s) ----
clear_screen
matrix_rain 10

# ---- PHASE 11: Skull + final warning ----
clear_screen
show_skull
sleep 1
final_warning
sleep 2

# ---- Hold until keypress ----
get_size
printf "\033[$((ROWS));1H${DIM}${C1}  [Press any key to terminate connection...]${RESET}"
read -n 1 -s

exit 0
