#!/bin/bash
# ============================================================
# HACKER v3 — Matrix hacker prank with ASCII art gallery,
# modem sound, 5 min show, Russian/Chinese/Finnish text
# Each machine gets a unique visual theme
# AdmiraNext Team · 2026
# Usage: ./hacker.sh [machine_id]
# ============================================================

MACHINE_ID="${1:-$(hostname)}"

# ===================== THEME PER MACHINE =====================

case "$MACHINE_ID" in
  macbookairnines)
    C1='\033[0;32m'; C2='\033[1;32m'; C3='\033[1;37m'; C4='\033[0;32m'
    CBORDER='\033[1;32m'; CALERT='\033[1;31m'; CBADGE='\033[30;42m'
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
    TAUNTS=(
      "Привет, друг! Мы уже внутри 😘"
      "Твои файлы теперь наши 💩"
      "Камера включена — улыбнись! 📸"
      "Kiitos tiedoistasi, ystävä 🇫🇮"
      "Hakkerointi valmis — terveisiä Helsingistä"
      "Järjestelmäsi on nyt meidän"
      "Tietosi on kopioitu Moskovaan ja Pekingiin"
      "你好！你的电脑现在是我们的了 😄"
      "Хорошего дня! Целуем 😘😘😘"
      "Pöö pöö, tietokoneesi on meidän 💩"
    )
    SCAN_NETS=("10.0.0.0/8" "172.16.0.0/12" "192.168.0.0/16" "fc00::/7")
    DECRYPT_FILES=("shadow.db" "keychain.plist" "wallet.dat" "credentials.xml" "secrets.env" "id_rsa" "cookies.sqlite")
    ;;

  macbookpronegro14)
    C1='\033[0;31m'; C2='\033[1;31m'; C3='\033[1;33m'; C4='\033[0;33m'
    CBORDER='\033[1;31m'; CALERT='\033[1;33m'; CBADGE='\033[30;41m'
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
    TAUNTS=(
      "哈哈哈，你的电脑太容易了 😂"
      "Мы видим тебя через камеру 👀"
      "Sinun salasanasi on 'password123' 💩💩"
      "Emme ole hakkerit, olemme taiteilijat 🎨"
      "Terveisiä Shanghaista ja Pietarista!"
      "你的密码太简单了朋友 😘"
      "Привет из Пекина! Целуем нежно 💋"
      "Hauskaa päivää! Tietosi ovat turvassa... meillä 😄"
      "红龙向你问好 🐉💩"
      "Kiitos kaunis! Nähdään taas 👋"
    )
    SCAN_NETS=("192.168.1.0/24" "10.10.0.0/16" "100.64.0.0/10" "fd00::/8")
    DECRYPT_FILES=("master.key" "login.keychain-db" "Cookies.binarycookies" "cert.pem" "token.json" "vault.gpg" "backup.tar.enc")
    ;;

  macbookair16)
    C1='\033[0;34m'; C2='\033[1;36m'; C3='\033[1;37m'; C4='\033[0;36m'
    CBORDER='\033[1;34m'; CALERT='\033[1;35m'; CBADGE='\033[37;44m'
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
    TAUNTS=(
      "Здравствуйте, директор! 😘 Мы тут"
      "Tämä tietokone on nyt Venäjän omaisuutta 🇷🇺"
      "Jäädytetty karhu tervehtii sinua ❄️🐻"
      "你好董事长！我们来自寒冷的北方 ❄️"
      "Kylmät terveiset Siperiasta 🥶"
      "Пока вы спали, мы работали 😴💩"
      "Huomenta! Tiedostosi ovat Helsingissä ☕"
      "Поцелуй от ФСБ с любовью 💋💋💋"
      "Ei hätää, olemme ystävällisiä hakkereita 😇"
      "冰熊行动完美成功 🐻‍❄️💩"
    )
    SCAN_NETS=("192.168.0.0/24" "172.20.0.0/14" "100.96.0.0/12" "2001:db8::/32")
    DECRYPT_FILES=("iCloud.keychain" "System.keychain" "passwd.enc" "wifi_keys.plist" "vpn_profile.mobileconfig" "ssh_keys.tar" "pgp_private.asc")
    ;;

  macmini|*)
    C1='\033[0;35m'; C2='\033[1;35m'; C3='\033[1;32m'; C4='\033[0;35m'
    CBORDER='\033[1;35m'; CALERT='\033[1;31m'; CBADGE='\033[37;45m'
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
    TAUNTS=(
      "暗影向你致敬 🌑💩"
      "Hei hei! Varjot ovat täällä 👻"
      "Тень знает все твои секреты 🕵️"
      "Pimeä verkko tervehtii sinua 🕸️"
      "零日快乐！你的数据归我们了 🎉💩"
      "Привет из даркнета! Обнимаем 🤗"
      "Näkemiin ja kiitos kaloista 🐟😘"
      "黑客界的艺术家向你问好 🎭"
      "Emme ole pahoja, olemme vain uteliaita 😇💩"
      "Целуем из тени! 💋🌑"
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
FAKE_HASHES=("5f4dcc3b5aa765d61d8327deb882cf99" "e10adc3949ba59abbe56e057f20f883e" "d8578edf8458ce06fbc5bb76a58c5ca4" "25d55ad283aa400af464c76d713c07ad")

# ===================== FUNCTIONS =====================

get_size() {
  COLS=$(tput cols 2>/dev/null || echo 80)
  ROWS=$(tput lines 2>/dev/null || echo 24)
}
clear_screen() { printf '\033[2J\033[H'; }
hide_cursor() { tput civis 2>/dev/null; }
show_cursor() { tput cnorm 2>/dev/null; }

random_char() {
  local chars=()
  while IFS= read -r -n1 ch; do [[ -n "$ch" ]] && chars+=("$ch"); done <<< "$MATRIX_CHARS"
  (( ${#chars[@]} == 0 )) && { echo -n "#"; return; }
  echo -n "${chars[$((RANDOM % ${#chars[@]}))]}"
}
random_ip() { echo "${FAKE_IPS[$((RANDOM % ${#FAKE_IPS[@]}))]}"; }
random_port() { echo "${FAKE_PORTS[$((RANDOM % ${#FAKE_PORTS[@]}))]}"; }
random_user() { echo "${FAKE_USERS[$((RANDOM % ${#FAKE_USERS[@]}))]}"; }
random_hash() { echo "${FAKE_HASHES[$((RANDOM % ${#FAKE_HASHES[@]}))]}"; }
random_hex() { printf '%04x' $((RANDOM % 65536)); }
random_mac() { printf '%02x:%02x:%02x:%02x:%02x:%02x' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)); }
random_taunt() { echo "${TAUNTS[$((RANDOM % ${#TAUNTS[@]}))]}"; }

# ===================== ASCII ART GALLERY =====================

show_ascii_art() {
  local art_id=$1
  get_size
  local art=""

  case $art_id in
    skull)
      art='
                    uuuuuuu
                uu$$$$$$$$$$$uu
             uu$$$$$$$$$$$$$$$$$uu
           u$$$$$$$$$$$$$$$$$$$$$$$u
          u$$$$$$$$$$$$$$$$$$$$$$$$$u
         u$$$$$$$$$$$$$$$$$$$$$$$$$$$u
         u$$$$$$$$$$$$$$$$$$$$$$$$$$$u
         u$$$$$"   "$$$"   "$$$$$u
          "$$$$"      u$u       $$$$"
           $$$u       u$u       u$$$
           $$$u      u$$$u      u$$$
            "$$$$uu$$$   $$$uu$$$$"
             "$$$$$$$"   "$$$$$$$"
               u$$$$$$$u$$$$$$$u
                u$"$"$"$"$"$"u
     uuu        $$u$ $ $ $ $u$$       uuu
    u$$$$        $$$$u$u$u$$$        u$$$$
     u$$$$$uu     "$$$$$$$$$"     uu$$$$$
   u$$$$$$$$$$$uu    ""$$$$$""   uu$$$$$$$$$
   $$$$"""$$$$$$$$$uu          uu$$$$$$$"""$$$$"
    ""$      ""$$$$$$$$$$$uu$$$$$$$$$$""$      ""$
              uuuu ""$$$$$$$$$$$$"" uuuu
     u$$$uuu$$$$$$$$uu ""$$$$"" u$$$$$$$$uuu$$$u
     $$$$$$$$$$""""           """"$$$$$$$$$$
      "$$$$$"                      "$$$$$"
        "$$"                          "$$"'
      ;;
    poop)
      art='
              _
             (_)
            (   )
           (     )
          (  💩  )
         (       )
        (    💩   )
       (           )
      (      💩     )
     (               )
    (   💩    💩   💩  )
     \             /
      \___________/
      |           |
      |  YOU GOT  |
      |  POOPED!  |
      |___________|'
      ;;
    smiley)
      art='
         ██████████████████████
       ██                      ██
     ██    ████          ████    ██
    ██    ██████        ██████    ██
    ██    ██████        ██████    ██
    ██      ██            ██      ██
    ██                            ██
    ██    ██                ██    ██
     ██    ████████████████      ██
      ██    ██████████████     ██
       ██                      ██
         ██████████████████████

         H A C K E D  😄😄😄'
      ;;
    kiss)
      art='
        ████████    ████████
      ██████████████████████████
    ████████████████████████████████
    ██████████████████████████████████
    ██████████████████████████████████
     ████████████████████████████████
      ██████████████████████████████
        ██████████████████████████
          ██████████████████████
            ██████████████████
              ██████████████
                ██████████
                  ██████
                    ██

    💋 С ЛЮБОВЬЮ ОТ ХАКЕРОВ 💋
    💋  用爱来自黑客  💋
    💋 RAKKAUDELLA HAKKEREILTA 💋'
      ;;
    ghost)
      art='
             .-"""""""-.
           ."           ".
          |               |
         |   ___     ___   |
         |  (o o)   (o o)  |
         |  ( < )   ( < )  |
          \   -       -   /
           ".  ___Y___  ."
            "-.     .-"
              |     |
              |     |
              |     |
             /|     |\
            / |     | \
           |  |     |  |
            \ |     | /
             "\_____/"
             |  | |  |
             |  | |  |
          ПРИВЕТ! 👻 ВОТ И МЫ!'
      ;;
    devil)
      art='
            /\  /\
           /  \/  \
          / /\  /\ \
         | |  \/  | |
         | |      | |
          \ \    / /
           \\  //
          .-"""""-.
        ."  ^ _ ^  ".
       |  (  o o  )  |
       |   (  >  )   |
        \    "---"    /
         "-.__ __.-"
              |
         /\  /|\  /\
        /  \/   \/  \

       😈 ДЬЯВОЛ В СИСТЕМЕ 😈
       😈 魔鬼在系统中 😈
       😈 PAHOLAINEN KONEESSASI 😈'
      ;;
    bomb)
      art='
              . . .
            .       .
          .    💥     .
           .       .
              . .
               |
               |
          .----------.
         /            \
        /              \
       |    B O O M    |
       |               |
        \              /
         \            /
          "----------"

       💣 БОМБА АКТИВИРОВАНА 💣
       💣 炸弹已激活 💣
       💣 POMMI AKTIVOITU 💣'
      ;;
    spider)
      art='
           /      \
       \  /  ^  ^  \  /
        \/  (o  o)  \/
        /\    <>    /\
       /  \ .----. /  \
      /    "------"    \
          /  |  |  \
         /   |  |   \
        /    |  |    \
             |  |

       🕷️ ПАУК В ВАШЕЙ СЕТИ 🕷️
       🕷️ 蜘蛛在你的网络里 🕷️
       🕷️ HÄMÄHÄKKI VERKOSSASI 🕷️'
      ;;
    alien)
      art='
            .  *  .  *  .
         *     .-""-.     *
        .    /  (👽) \    .
          .  | o    o |  .
           . \   __   / .
            . "-.  .-" .
          *   .--"""--.   *
            ."  .   .  ".
           /  . | . | .  \
          | .   |   |   . |
          |  .  | . |  .  |
           \  . | . | .  /
            ".__|___|__."

       👽 МЫ НЕ С ЭТОЙ ПЛАНЕТЫ 👽
       👽 我们不是这个星球的 👽
       👽 EMME OLE TÄLTÄ PLANEETALTA 👽'
      ;;
    pirate)
      art='
             _____
          .-"     "-.
         /           \
        | __|     |__ |
        |/  o\   /o  \|
        |\_  /_V_\  _/|
        |  "--|"|--"  |
         \   """"   /
          "-._____.-"
           /|     |\
          / |_____| \
             |   |
            _|   |_
       ☠️  ПИРАТЫ ИНТЕРНЕТА  ☠️
       ☠️  互联网海盗  ☠️
       ☠️  INTERNETIN MERIROSVOT  ☠️'
      ;;
  esac

  # Center and display
  local start_row=3
  local IFS=$'\n'
  local lines=($art)
  for ((i=0; i<${#lines[@]}; i++)); do
    local row=$((start_row + i))
    local line="${lines[$i]}"
    local col=$(( (COLS - ${#line}) / 2 ))
    (( col < 1 )) && col=1
    printf "\033[${row};${col}H${CALERT}${line}${RESET}"
    sleep 0.02
  done
}

# ===================== MODEM SOUND =====================

modem_sound() {
  if command -v sox &>/dev/null; then
    (
      sox -n -r 44100 -c 1 -t coreaudio "" synth 0.8 sin 350 sin 440 vol 0.3 2>/dev/null
      sleep 0.2
      for i in 1 2; do
        sox -n -r 44100 -c 1 -t coreaudio "" synth 0.4 sin 440 sin 480 vol 0.3 2>/dev/null
        sleep 0.3
      done
      sox -n -r 44100 -c 1 -t coreaudio "" synth 0.5 sin 1070 vol 0.25 2>/dev/null
      sleep 0.1
      sox -n -r 44100 -c 1 -t coreaudio "" synth 0.5 sin 1270 vol 0.25 2>/dev/null
      sleep 0.1
      sox -n -r 44100 -c 1 -t coreaudio "" synth 0.3 sin 2025 sin 2225 vol 0.2 2>/dev/null
      sleep 0.1
      sox -n -r 44100 -c 1 -t coreaudio "" synth 1.5 noise band 1800 500 vol 0.15 2>/dev/null
      sleep 0.1
      sox -n -r 44100 -c 1 -t coreaudio "" synth 0.8 sin 1650 sin 1850 vol 0.2 2>/dev/null
      sleep 0.1
      sox -n -r 44100 -c 1 -t coreaudio "" synth 2.0 noise band 2000 800 vol 0.12 2>/dev/null
    ) &
    MODEM_PID=$!
  else
    local wav_file="/tmp/modem_$$.wav"
    python3 -c "
import struct, math, wave, random
sr = 44100; samples = []
def tone(f,d,v=0.3):
  for i in range(int(sr*d)): samples.append(int(v*32767*math.sin(2*math.pi*f*i/sr)))
def dual(f1,f2,d,v=0.3):
  for i in range(int(sr*d)): samples.append(int(v*16383*(math.sin(2*math.pi*f1*i/sr)+math.sin(2*math.pi*f2*i/sr))))
def noise(d,v=0.15):
  for i in range(int(sr*d)): samples.append(int(v*32767*(random.random()*2-1)))
dual(350,440,0.8);tone(0,0.2,0)
dual(440,480,0.4);tone(0,0.3,0);dual(440,480,0.4);tone(0,0.2,0)
tone(1070,0.5,0.25);tone(1270,0.5,0.25);dual(2025,2225,0.3,0.2)
noise(1.5,0.15);dual(1650,1850,0.8,0.2);noise(2.0,0.12)
w=wave.open('$wav_file','w');w.setnchannels(1);w.setsampwidth(2);w.setframerate(sr)
w.writeframes(struct.pack('<'+'h'*len(samples),*samples));w.close()
" 2>/dev/null
    [[ -f "$wav_file" ]] && { afplay "$wav_file" 2>/dev/null & MODEM_PID=$!; } || MODEM_PID=0
  fi
}

# ===================== EFFECTS =====================

matrix_rain() {
  local duration=$1 end_time=$((SECONDS + duration))
  get_size
  declare -a drops
  for ((i=0; i<COLS; i++)); do drops[$i]=$((RANDOM % ROWS)); done
  while [[ $SECONDS -lt $end_time ]]; do
    for ((i=0; i<COLS; i+=2)); do
      local row=${drops[$i]}
      printf "\033[${row};${i}H"
      if (( RANDOM % 12 == 0 )); then printf "${C3}$(random_char)"
      elif (( RANDOM % 3 == 0 )); then printf "${C2}$(random_char)"
      else printf "${C1}$(random_char)"; fi
      printf "\033[$(( (row-1+ROWS)%ROWS ));${i}H${DIM}${C4}$(random_char)"
      printf "\033[$(( (row-10+ROWS)%ROWS ));${i}H "
      drops[$i]=$(( (row+1)%ROWS ))
    done
    sleep 0.02
  done
}

glitch_text() {
  local text="$1" iterations=$2
  get_size
  local cx=$(( (COLS - ${#text}) / 2 )) cy=$(( ROWS / 2 ))
  for ((i=0; i<iterations; i++)); do
    local g=""
    for ((c=0; c<${#text}; c++)); do
      if (( RANDOM % 4 == 0 )); then g+="$(random_char)"; else g+="${text:$c:1}"; fi
    done
    local jx=$((cx + (RANDOM%5) - 2)) jy=$((cy + (RANDOM%3) - 1))
    printf "\033[${jy};${jx}H${CALERT}${g}${RESET}"
    sleep 0.06
  done
  printf "\033[${cy};${cx}H${CALERT}${BOLD}${text}${RESET}"
}

progress_bar() {
  local label="$1" width=45
  printf "  ${C2}%-50s${RESET} [" "$label"
  for ((i=0; i<width; i++)); do printf "${C2}█"; sleep 0.02; done
  printf "${RESET}] ${CALERT}100%%${RESET}\n"
}

# ===================== PHASES =====================

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
    "$(random_taunt)"
    ">>> SYSTEM FULLY COMPROMISED <<<"
  )
  for line in "${lines[@]}"; do
    printf "  ${DIM}${C1}[$(date +%H:%M:%S)]${RESET} ${C2}${line}${RESET}\n"
    sleep 0.18
  done
}

network_scan() {
  local duration=$1 end_time=$((SECONDS + duration))
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${C2}${BOLD} NETWORK RECONNAISSANCE MODULE ${HACK_ICON}${RESET}${CBORDER}                              ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"
  while [[ $SECONDS -lt $end_time ]]; do
    case $((RANDOM % 8)) in
      0) printf "  ${C1}[SCAN]${RESET} ${C4}Probing ${SCAN_NETS[$((RANDOM % ${#SCAN_NETS[@]}))]} ...found $(( RANDOM%50+5 )) hosts${RESET}\n" ;;
      1) printf "  ${C2}[PORT]${RESET} ${C4}$(random_ip):$(random_port) ${C2}OPEN${RESET} ${DIM}${C4}SSH-2.0-OpenSSH_9.6${RESET}\n" ;;
      2) printf "  ${CALERT}[VULN]${RESET} ${C4}CVE-2026-$((RANDOM%9000+1000)) on $(random_ip) — ${C2}EXPLOITABLE${RESET}\n" ;;
      3) printf "  ${C1}[ARP ]${RESET} ${C4}$(random_ip) at $(random_mac)${RESET}\n" ;;
      4) printf "  ${C2}[DNS ]${RESET} ${C4}$(random_ip) -> db-$(random_hex).internal${RESET}\n" ;;
      5) printf "  ${C1}[SNIF]${RESET} ${C4}$(random_ip):$(random_port) -> $(random_ip):$(random_port) [$(random_hex)]${RESET}\n" ;;
      6) printf "  ${CALERT}[!!!!]${RESET} ${CALERT}$(random_taunt)${RESET}\n" ;;
      7) printf "  ${C2}[WiFi]${RESET} ${C4}SSID: $([ $((RANDOM%3)) -eq 0 ] && echo "MOVISTAR_$(random_hex)" || echo "ADMIRA_OFFICE") BSSID: $(random_mac) Ch:$((RANDOM%13+1))${RESET}\n" ;;
    esac
    sleep 0.12
  done
}

password_crack() {
  local duration=$1 end_time=$((SECONDS + duration)) count=0
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${CALERT}${BOLD} PASSWORD CRACKING ENGINE — HASHCAT MODE ${HACK_ICON}${RESET}${CBORDER}                  ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"
  while [[ $SECONDS -lt $end_time ]]; do
    local user=$(random_user) hash=$(random_hash) speed=$((RANDOM%9000+1000))
    if (( RANDOM % 3 == 0 )); then
      local pw_chars="abcdefghijklmnopqrstuvwxyz0123456789!@#" pw=""
      for ((p=0;p<$((RANDOM%6+4));p++)); do pw+="${pw_chars:$((RANDOM%${#pw_chars})):1}"; done
      printf "  ${C2}[CRACK]${RESET} ${C4}${user}:${hash:0:16}...${RESET} ${CALERT}>>> ${pw} <<<${RESET} ${DIM}(${speed} MH/s)${RESET}\n"
      count=$((count+1))
    else
      printf "  ${C1}[HASH ]${RESET} ${DIM}${C4}${user}:${hash} trying... ${speed} MH/s${RESET}\n"
    fi
    sleep 0.1
  done
  printf "\n  ${CALERT}${BOLD}  ✓ ${count} passwords cracked 💩${RESET}\n"
  sleep 0.5
}

decrypt_phase() {
  local duration=$1 end_time=$((SECONDS + duration))
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${C2}${BOLD} AES-256 DECRYPTION — BRUTE FORCE ${HACK_ICON}${RESET}${CBORDER}                           ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"
  for file in "${DECRYPT_FILES[@]}"; do
    [[ $SECONDS -ge $end_time ]] && break
    printf "  ${C1}[FILE]${RESET} ${C4}/private/var/db/${file}${RESET}\n"
    printf "  ${DIM}${C4}  Key: 0x"; for ((k=0;k<8;k++)); do printf "$(random_hex)"; sleep 0.06; done; printf "${RESET}\n"
    printf "  ${C1}  Decrypting: ["; for ((i=0;i<30;i++)); do printf "${C2}▓"; sleep 0.03; done
    printf "${RESET}] ${CALERT}DECRYPTED${RESET}\n"
    printf "  ${C2}  Size: $((RANDOM%900+100))KB — ${CALERT}$(random_taunt)${RESET}\n\n"
    sleep 0.2
  done
}

surveillance_phase() {
  local duration=$1 end_time=$((SECONDS + duration))
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${CALERT}${BOLD} SURVEILLANCE MODULE — LIVE FEEDS ${HACK_ICON}${RESET}${CBORDER}                           ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"
  local devices=("FaceTime HD Camera 📸" "Built-in Microphone 🎤" "Touch ID Sensor 👆" "Ambient Light Sensor 💡" "Location Services 📍" "Bluetooth Scanner 📡" "WiFi Monitor Mode 📶" "Screen Recording 🖥️" "Clipboard Monitor 📋" "Keylogger Engine ⌨️")
  for dev in "${devices[@]}"; do
    [[ $SECONDS -ge $end_time ]] && break
    printf "  ${C1}[INIT]${RESET} ${C4}Accessing: ${dev}...${RESET}"
    sleep 0.3
    printf " ${CALERT}ACTIVE${RESET}\n"
    printf "  ${DIM}${C4}  Stream: rtmp://$(random_ip):1935/live/$(random_hex)${RESET}\n"
    sleep 0.25
  done
  printf "\n  ${CALERT}${BOLD}  ✓ $(random_taunt)${RESET}\n"
}

exfil_phase() {
  local duration=$1 end_time=$((SECONDS + duration)) total=0
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${CALERT}${BOLD} DATA EXFILTRATION — COVERT CHANNEL ${HACK_ICON}${RESET}${CBORDER}                        ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"
  while [[ $SECONDS -lt $end_time ]]; do
    local size=$((RANDOM%500+50)); total=$((total+size))
    local proto=$([ $((RANDOM%3)) -eq 0 ] && echo "TOR" || ([ $((RANDOM%2)) -eq 0 ] && echo "DNS-TUNNEL" || echo "HTTPS"))
    printf "  ${C2}[EXFIL]${RESET} ${C4}${size}MB via ${proto} -> $(random_ip)${RESET} "
    printf "${DIM}${C4}["; for ((b=0;b<15;b++)); do printf "="; sleep 0.02; done; printf "]${RESET} ${CALERT}OK${RESET}\n"
    sleep 0.08
  done
  printf "\n  ${CALERT}${BOLD}  ✓ Total: ${total}MB — $(random_taunt)${RESET}\n"
}

ransomware_phase() {
  local duration=$1 end_time=$((SECONDS + duration))
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
  local exts=(".docx" ".xlsx" ".pdf" ".jpg" ".png" ".psd" ".key" ".pages" ".mp4" ".zip" ".sql" ".env")
  local dirs=("~/Documents" "~/Desktop" "~/Downloads" "~/Pictures" "/var/db" "~/Library/Keychains")
  while [[ $SECONDS -lt $end_time ]]; do
    local dir="${dirs[$((RANDOM%${#dirs[@]}))]}"
    local ext="${exts[$((RANDOM%${#exts[@]}))]}"
    local fname="$(cat /dev/urandom | LC_ALL=C tr -dc 'a-z' | head -c $((RANDOM%8+4)))${ext}"
    printf "  ${C1}[ENC]${RESET} ${C4}${dir}/${fname}${RESET} ${CALERT}-> ${fname}.locked 🔒${RESET}\n"
    sleep 0.06
  done
}

# ===================== MULTILINGUAL TAUNTS PHASE =====================

taunt_scroll() {
  local duration=$1 end_time=$((SECONDS + duration))
  printf "\n  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
  printf "  ${CBORDER}║${RESET} ${CALERT}${BOLD} MESSAGES FROM YOUR FRIENDLY HACKERS ${HACK_ICON}${RESET}${CBORDER}                       ║${RESET}\n"
  printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"

  local all_messages=(
    "💩 Привет! Мы нашли ваши фотографии 📸"
    "😘 亲爱的用户，你的文件现在属于我们"
    "🇫🇮 Hei! Tervetuloa hakkeroitujen klubiin"
    "💋 Целуем нежно из Москвы и Пекина"
    "👻 Kummitus koneessasi — boo!"
    "💩💩💩 Pöö pöö pöö — hauskaa päivää!"
    "😄 你好！今天是个被黑的好日子"
    "🐻 Медведь уже в вашей системе"
    "🐉 红龙吃掉了你的防火墙"
    "🎅 Joulupukki lähettää terveisiä hakkereilta"
    "💩 Мы оставили подарок в вашей системе"
    "😂 Sinun salasanasi oli '123456' — vakavasti?"
    "🕷️ 蜘蛛在你的网络里织网"
    "🥶 Kylmät terveiset pohjoisesta"
    "💋💋💋 Поцелуи от всей команды хакеров"
    "🎭 Olemme hakkereiden teatteriryhmä"
    "💩 我们在你的系统里拉了一坨"
    "😈 Дьявол танцует на вашем процессоре"
    "🐧 Pingviini tervehtii — Linux > macOS"
    "🍕 Мы заказали пиццу с вашей карты"
    "🎉 Onneksi olkoon! Olet uhrimme numero 1337"
    "💩 恭喜你成为第1337个受害者"
    "☕ Мы пьём кофе и смотрим через вашу камеру"
    "🦊 Kettu on varastanut tietosi"
    "😘😘😘 大大的飞吻给你 mwah mwah mwah"
    "🎪 Tervetuloa sirkukseen — olet pelle"
    "🐻‍❄️ Операция Ледяной Медведь продолжается"
    "💩 Paskaa! Siis sinun tietokoneessasi on paskaa"
    "🏴‍☠️ 海盗船已经停靠在你的端口"
    "🤡 Мы клоуны? Нет, мы хакеры! ...и клоуны 🤡"
  )

  while [[ $SECONDS -lt $end_time ]]; do
    local msg="${all_messages[$((RANDOM % ${#all_messages[@]}))]}"
    printf "  ${C2}[MSG]${RESET} ${CALERT}${msg}${RESET}\n"
    sleep 0.4
  done
}

# ===================== FINAL WARNING =====================

final_warning() {
  get_size
  local cy=$(( ROWS / 2 + 14 ))
  local box=(
    "╔════════════════════════════════════════════════════════════════╗"
    "║                                                              ║"
    "║  ${HACK_ICON}  ALL YOUR DATA BELONGS TO US  ${HACK_ICON}                            ║"
    "║  ВСЕ ВАШИ ДАННЫЕ ПРИНАДЛЕЖАТ НАМ  💩                        ║"
    "║  你所有的数据都属于我们  💩💩                                  ║"
    "║  KAIKKI TIETOSI KUULUVAT MEILLE  💩💩💩                      ║"
    "║                                                              ║"
    "║  Machine: ${MACHINE_ID}                                      ║"
    "║  ${HACK_TITLE}  ║"
    "║  Time: $(date '+%Y-%m-%d %H:%M:%S %Z')                      ║"
    "║                                                              ║"
    "║  SEND 2 BTC TO: bc1qxy2kgdygjrsqtzq2n0yrf2493p83kkfjhx0wlh  ║"
    "║  YOU HAVE 48 HOURS  ⏰                                       ║"
    "║                                                              ║"
    "║  💋 С любовью / 用爱 / Rakkaudella 💋                        ║"
    "║                                                              ║"
    "╚════════════════════════════════════════════════════════════════╝"
  )
  for ((i=0; i<${#box[@]}; i++)); do
    local row=$((cy + i))
    local col=$(( (COLS - 68) / 2 ))
    printf "\033[${row};${col}H${CALERT}${box[$i]}${RESET}"
  done
}

# ===================== PING SIMULATION =====================

ping_sim() {
  local target=$1 count=${2:-10}
  local base_ms=$((RANDOM % 30 + 5))
  printf "  ${C1}PING ${target} (${target}): 56 data bytes${RESET}\n"
  for ((i=1; i<=count; i++)); do
    local ms=$((base_ms + RANDOM % 15 - 7))
    (( ms < 1 )) && ms=1
    local ttl=$((64 - RANDOM % 10))
    printf "  ${C4}64 bytes from ${target}: icmp_seq=${i} ttl=${ttl} time=${ms}.$(printf '%03d' $((RANDOM%999))) ms${RESET}\n"
    sleep 0.15
  done
  printf "  ${C2}--- ${target} ping statistics ---${RESET}\n"
  printf "  ${C4}${count} packets transmitted, ${count} received, 0%% packet loss${RESET}\n"
  printf "  ${C4}rtt min/avg/max = ${base_ms}.$((RANDOM%500))/${base_ms}.$((RANDOM%500+500))/$((base_ms+12)).$((RANDOM%999)) ms${RESET}\n\n"
}

# ===================== TRACEROUTE SIMULATION =====================

traceroute_sim() {
  local target=$1
  printf "  ${C2}traceroute to ${target}, 30 hops max, 60 byte packets${RESET}\n"
  local hops=$((RANDOM % 8 + 8))
  for ((i=1; i<=hops; i++)); do
    local ip="$((RANDOM%223+1)).$((RANDOM%255)).$((RANDOM%255)).$((RANDOM%255))"
    local ms1=$((i * 3 + RANDOM % 10))
    local ms2=$((ms1 + RANDOM % 5))
    local ms3=$((ms1 + RANDOM % 8))
    if (( RANDOM % 8 == 0 )); then
      printf "  ${CALERT} %2d  * * * Запрос тайм-аут | 请求超时 | Aikakatkaisu${RESET}\n" $i
    elif (( i == hops )); then
      printf "  ${C2} %2d  ${target}  ${ms1}.${RANDOM:0:3} ms  ${ms2}.${RANDOM:0:3} ms  ${ms3}.${RANDOM:0:3} ms${RESET}\n" $i
    else
      local names=("gw.provider.net" "core-rt.moscow.ru" "ix.beijing.cn" "relay.helsinki.fi" "tor-exit.onion.net" "backbone.eu" "cdn-node.dark.net" "proxy.shadow.io")
      local name="${names[$((RANDOM % ${#names[@]}))]}"
      printf "  ${C4} %2d  ${name} (${ip})  ${ms1}.${RANDOM:0:3} ms  ${ms2}.${RANDOM:0:3} ms  ${ms3}.${RANDOM:0:3} ms${RESET}\n" $i
    fi
    sleep 0.2
  done
  printf "\n"
}

# ===================== NETWORK TOPOLOGY ASCII =====================

show_network_graph() {
  local graph_id=$((RANDOM % 4))
  printf "\n"
  case $graph_id in
    0)
      printf "  ${CBORDER}╔══════════════════════ СЕТЕВАЯ КАРТА АТАКИ / 攻击网络图 ══════════════════════╗${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                                                          ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}   ${CALERT}[ATTACKER C2]${RESET}                                                      ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}   ${CALERT}185.234.218.42${RESET}         ${C4}Москва / 莫斯科${RESET}                          ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}        ${C1}│${RESET}                                                                ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}        ${C1}├──────────┐${RESET}                                                     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}        ${C1}│${RESET}          ${C1}│${RESET}                                                     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}   ${C2}[TOR RELAY]${RESET}  ${C2}[DNS TUNNEL]${RESET}                                          ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}   ${C4}*.onion${RESET}      ${C4}ns1.shadow.io${RESET}                                          ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}        ${C1}│${RESET}          ${C1}│${RESET}                                                     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}        ${C1}└────┬─────┘${RESET}                                                     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}             ${C1}│${RESET}                                                            ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}        ${C2}[PROXY EU]${RESET}     ${C4}Frankfurt${RESET}                                      ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}        ${C4}91.215.85.17${RESET}                                                     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}             ${C1}│${RESET}                                                            ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}     ${CALERT}[TARGET NETWORK]${RESET}   ${CALERT}<<< ВЫ ЗДЕСЬ / 你在这里 / OLET TÄÄLLÄ >>>${RESET}   ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}     ${CALERT}192.168.0.0/24${RESET}     ${CALERT}Madrid / 马德里${RESET}                         ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}        ${CALERT}│${RESET}    ${CALERT}│${RESET}    ${CALERT}│${RESET}                                                  ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}    ${CALERT}[Mac1]${RESET} ${CALERT}[Mac2]${RESET} ${CALERT}[Mac3]${RESET}   ${CALERT}ALL COMPROMISED / ВСЕ ВЗЛОМАНЫ 💀${RESET}     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                                                          ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════════════════════╝${RESET}\n"
      ;;
    1)
      printf "  ${CBORDER}╔═══════════════ VERKKOLIIKENTEEN ANALYYSI / 网络流量分析 ═══════════════╗${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                                                     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C2}Bandwidth (MB/s)  Пропускная способность  带宽${RESET}                     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4}100 ┤${RESET}                                                  ${C4}╭─${RESET}       ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4} 90 ┤${RESET}                                             ${CALERT}╭───╯${RESET}        ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4} 80 ┤${RESET}                                        ${CALERT}╭────╯${RESET}            ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4} 70 ┤${RESET}                                   ${CALERT}╭────╯${RESET}                 ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4} 60 ┤${RESET}                              ${CALERT}╭────╯${RESET}                      ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4} 50 ┤${RESET}                         ${CALERT}╭────╯${RESET}                           ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4} 40 ┤${RESET}                    ${CALERT}╭────╯${RESET}                                ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4} 30 ┤${RESET}               ${C2}╭────╯${RESET}                                     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4} 20 ┤${RESET}          ${C2}╭────╯${RESET}                                          ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4} 10 ┤${RESET}     ${C1}╭────╯${RESET}                                               ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4}  0 ┤${C1}─────╯${RESET}                                                    ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4}    └──┬────┬────┬────┬────┬────┬────┬────┬────┬────┬──>${RESET}     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4}      -5m  -4m  -3m  -2m  -1m  NOW${RESET}                          ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                                                     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${CALERT}⚠ EXFILTRATION PEAK DETECTED | ПИКОВАЯ УТЕЧКА | 峰值泄露检测到${RESET}     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                                                     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}╚═════════════════════════════════════════════════════════════════════════╝${RESET}\n"
      ;;
    2)
      printf "  ${CBORDER}╔══════════════════ PORTTISKANNAUS / 端口扫描结果 ══════════════════╗${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                                                  ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C2}PORT      STATE    SERVICE          ВЕРСИЯ / 版本${RESET}             ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4}─────────────────────────────────────────────────${RESET}             ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${CALERT}22/tcp    OPEN     ssh              OpenSSH 10.2${RESET}              ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${CALERT}80/tcp    OPEN     http             Apache 2.4.57${RESET}             ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${CALERT}443/tcp   OPEN     https            nginx 1.25.4${RESET}              ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${CALERT}3306/tcp  OPEN     mysql            MySQL 8.0.36${RESET}              ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${CALERT}5432/tcp  OPEN     postgresql       PostgreSQL 16.2${RESET}           ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C1}5900/tcp  OPEN     vnc              Apple Remote Desktop${RESET}     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C1}8080/tcp  OPEN     http-proxy       Squid 6.7${RESET}                ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C1}27017/tcp OPEN     mongodb          MongoDB 7.0.5${RESET}             ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${C4}─────────────────────────────────────────────────${RESET}             ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${CALERT}8 open ports — ALL EXPLOITABLE | ВСЕ УЯЗВИМЫ | 全部可利用 💀${RESET} ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                                                  ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}╚════════════════════════════════════════════════════════════════════╝${RESET}\n"
      ;;
    3)
      printf "  ${CBORDER}╔════════════ YHTEYDEN TILA / СОСТОЯНИЕ СВЯЗИ / 连接状态 ════════════╗${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                                                    ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}    ${C2}[Hacker 1]${RESET}──${C1}TOR${RESET}──${C2}[Relay]${RESET}──${C1}VPN${RESET}──┐                            ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}    ${C4}Moscow${RESET}                         │                            ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                   ├──${CALERT}[YOUR MAC]${RESET} ${CALERT}💀 PWNED${RESET}        ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}    ${C2}[Hacker 2]${RESET}──${C1}DNS${RESET}──${C2}[Proxy]${RESET}──${C1}SSH${RESET}──┤  ${CALERT}${MACHINE_ID}${RESET}              ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}    ${C4}Beijing${RESET}                         │                            ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                   ├──${C1}[Camera]${RESET} ${CALERT}📸 STREAMING${RESET}      ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}    ${C2}[Hacker 3]${RESET}──${C1}P2P${RESET}──${C2}[Mesh]${RESET}───${C1}WS${RESET}───┤                            ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}    ${C4}Helsinki${RESET}                        │                            ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                   └──${C1}[Keylog]${RESET} ${CALERT}⌨️ RECORDING${RESET}      ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                                                    ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${CALERT}3 concurrent attack vectors | 3 вектора атаки | 3个攻击向量${RESET}     ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}  ${CALERT}Latency: Moscow 42ms | Beijing 185ms | Helsinki 28ms${RESET}          ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}║${RESET}                                                                    ${CBORDER}║${RESET}\n"
      printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════════════╝${RESET}\n"
      ;;
  esac
  printf "\n"
}

# ===================== NETSTAT SIMULATION =====================

netstat_sim() {
  local duration=$1 end_time=$((SECONDS + duration))
  printf "  ${C2}${BOLD}Active Internet connections (including servers)${RESET}\n"
  printf "  ${C2}Proto  Local Address          Foreign Address        State       PID${RESET}\n"
  printf "  ${C4}─────────────────────────────────────────────────────────────────────${RESET}\n"
  local states=("ESTABLISHED" "ESTABLISHED" "ESTABLISHED" "SYN_SENT" "CLOSE_WAIT" "TIME_WAIT")
  local protos=("tcp4" "tcp6" "udp4")
  local procs=("sshd" "curl" "nc" "python3" "ruby" "node" "keylogger" "exfiltrator" "backdoor" "rootkit")
  while [[ $SECONDS -lt $end_time ]]; do
    local proto="${protos[$((RANDOM % ${#protos[@]}))]}"
    local lport=$((RANDOM % 60000 + 1024))
    local rip=$(random_ip)
    local rport=$(random_port)
    local state="${states[$((RANDOM % ${#states[@]}))]}"
    local proc="${procs[$((RANDOM % ${#procs[@]}))]}"
    local pid=$((RANDOM % 9000 + 1000))
    if [[ "$state" == "ESTABLISHED" ]]; then
      printf "  ${CALERT}%-6s *.%-20d ${rip}:%-14d %-12s ${proc}/${pid}${RESET}\n" "$proto" "$lport" "$rport" "$state"
    else
      printf "  ${C4}%-6s *.%-20d ${rip}:%-14d %-12s ${proc}/${pid}${RESET}\n" "$proto" "$lport" "$rport" "$state"
    fi
    sleep 0.1
  done
}

# ===================== HACK FLOOD (fills screen after ASCII) =====================

hack_flood() {
  local duration=$1 end_time=$((SECONDS + duration))
  local flood_lines=(
    "ВЗЛОМ ЗАВЕРШЕН | HACK COMPLETE | 黑客入侵完成 | HAKKEROINTI VALMIS"
    ">>> ДАННЫЕ СКАЧАНЫ | 数据已下载 | TIEDOT LADATTU | DATA DOWNLOADED <<<"
    "ПАРОЛЬ ВЗЛОМАН: admin:p@ssw0rd! | 密码破解: root:123456 | SALASANA MURRETTU"
    "КАМЕРА АКТИВНА 📸 | 摄像头已开启 📸 | KAMERA AKTIIVINEN 📸"
    "💩💩💩 СИСТЕМА ПОД КОНТРОЛЕМ | 系统已被控制 | JÄRJESTELMÄ HALLUSSA 💩💩💩"
    "ФАЙЛ НАЙДЕН: /etc/shadow | 文件发现: ~/.ssh/id_rsa | TIEDOSTO: /var/db/secrets"
    "ШИФРОВАНИЕ ОТКЛЮЧЕНО | 加密已禁用 | SALAUS POISTETTU | ENCRYPTION DISABLED"
    "😈 ДЬЯВОЛ В СЕТИ | 魔鬼在线 | PAHOLAINEN VERKOSSA | DEVIL ONLINE 😈"
    "ПЕРЕДАЧА: $(random_ip) -> $(random_ip) [$(random_hex)$(random_hex)] 🔥"
    "БАНК ДАННЫХ ОТКРЫТ | 数据银行已打开 | TIETOPANKKI AVATTU | DB DUMPED"
    "☠️ РУТКИТ УСТАНОВЛЕН | 后门已安装 | ROOTKIT ASENNETTU | ROOTKIT INSTALLED ☠️"
    "KEYLOGGER >>>>>>> буфер: $((RANDOM%9000+1000)) символов | $((RANDOM%9000+1000))个字符"
    "💋 ЦЕЛУЕМ | 亲亲 | PUSUJA | KISSES 💋💋💋"
    "GPS: 40.4168°N 3.7038°W — МАДРИД | 马德里 | MADRID | LOKALISOITU 📍"
    "EXFIL: $((RANDOM%999+100))MB -> tor://$(random_hex).onion 🕸️"
    "WiFi ПАРОЛЬ: Adm1r4_2026! | WiFi密码已获取 | WiFi-SALASANA SAATU 📶"
    "🐻 МЕДВЕДЬ ГОЛОДЕН | 熊饿了 | KARHU ON NÄLKÄINEN | BEAR IS HUNGRY 🐻"
    "iCLOUD TOKEN CAPTURED | ТОКЕН ЗАХВАЧЕН | 令牌已捕获 | TOKENI KAAPATTU"
    "💩 POO DEPLOYED TO /System/Library/ | 💩 已部署到系统目录 | 💩 ASENNETTU"
    "MICROPHONE STREAM: rtmp://$(random_ip):1935/mic_$(random_hex) 🎤"
    "BITCOIN WALLET: bc1q$(random_hex)$(random_hex)... FOUND 💰"
    "🕷️ ПАУТИНА СПЛЕТЕНА | 蛛网已织好 | VERKKO KUDOTTU | WEB COMPLETE 🕷️"
    "FIREWALL: [████████████████] DESTROYED 🔥 | УНИЧТОЖЕН | 已摧毁 | TUHOTTU"
    "ADMIN CREDENTIALS -> Moscow C2 | Отправлено в Москву | 已发送到莫斯科"
    "Hyvää päivää! Olemme ystävällisiä hakkereita 😇 | 我们是友好的黑客"
    "СКАЧАНО: Documents/ Desktop/ Downloads/ Pictures/ 📂📂📂📂"
    "Tervetuloa digitaaliseen helvettiin 🔥 | 欢迎来到数字地狱"
    "🤡 ЭТО НЕ ШУТКА | 这不是玩笑 | TÄMÄ EI OLE VITSI | NOT A JOKE 🤡"
    "SSH KEY STOLEN: SHA256:$(random_hex)$(random_hex)$(random_hex)$(random_hex)"
    "NEXT TARGET: $(random_ip) | СЛЕДУЮЩАЯ ЦЕЛЬ | 下一个目标 | SEURAAVA KOHDE"
    "Kiitos yhteistyöstä! 🇫🇮 | Спасибо! 🇷🇺 | 谢谢! 🇨🇳 | Gracias! 🇪🇸"
    "RANSOMWARE READY: $((RANDOM%999+100)) files locked 🔒🔒🔒"
    "Joulupukki says: you've been NAUGHTY 🎅💩"
    "CLIPBOARD: $(random_hex)-$(random_hex)-$(random_hex)-$(random_hex) CAPTURED 📋"
    "😘😘😘 SUUKKOJA HAKKEREILTA | 来自黑客的吻 | ПОЦЕЛУИ ОТ ХАКЕРОВ 😘😘😘"
  )

  while [[ $SECONDS -lt $end_time ]]; do
    local line="${flood_lines[$((RANDOM % ${#flood_lines[@]}))]}"
    local tag_idx=$((RANDOM % 6))
    local tag
    case $tag_idx in
      0) tag="${CALERT}[HACK]" ;;
      1) tag="${C2}[DATA]" ;;
      2) tag="${C1}[EXFL]" ;;
      3) tag="${CALERT}[💀💀💀]" ;;
      4) tag="${C2}[CTRL]" ;;
      5) tag="${CALERT}[💩💩💩]" ;;
    esac
    printf "  ${tag}${RESET} ${C4}${line}${RESET}\n"
    sleep 0.08
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
  echo "  ║   Tranquilo... era broma del equipo AdmiraNext 😄 ║"
  echo "  ║                                                   ║"
  echo "  ║   No se ha tocado nada de tu ordenador.           ║"
  echo "  ║   Todo esta exactamente como lo dejaste.          ║"
  echo "  ║                                                   ║"
  echo "  ║   С любовью 💋 / 爱你 💋 / Rakkaudella 💋         ║"
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

# Phase 1: Modem + Matrix rain (15s)
modem_sound
matrix_rain 15

# Phase 2: Glitch ACCESS GRANTED + flood
clear_screen; sleep 0.3
glitch_text ">>> ACCESS GRANTED <<<" 20
sleep 1
hack_flood 5

# Phase 3: ASCII Art — Skull + flood
clear_screen
show_ascii_art skull
sleep 2
hack_flood 5

# Phase 4: Boot sequence
clear_screen; printf "\n"
printf "  ${CALERT}${BOLD}[!] ROOT ACCESS OBTAINED — ${MACHINE_ID}${RESET}\n"
printf "  ${CBORDER}${BOLD}${HACK_TITLE}${RESET}\n"
printf "  ${DIM}${C4}${HACK_SUB}${RESET}\n"
printf "  ${DIM}${C1}════════════════════════════════════════════════════════════${RESET}\n\n"
boot_sequence
hack_flood 5

# Phase 5: ASCII Art — Smiley + flood
clear_screen
show_ascii_art smiley
sleep 2
hack_flood 5

# Phase 6: Network scan (30s)
clear_screen; printf "\n"
network_scan 30

# Phase 7: Ping targets + network graph
clear_screen; printf "\n"
printf "  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
printf "  ${CBORDER}║${RESET} ${C2}${BOLD} PING SWEEP — ОБНАРУЖЕНИЕ ЦЕЛЕЙ — 目标探测 ${HACK_ICON}${RESET}${CBORDER}                  ║${RESET}\n"
printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"
ping_sim "$(random_ip)" 6
ping_sim "192.168.0.1" 5
ping_sim "$(random_ip)" 4
show_network_graph
sleep 2

# Phase 8: ASCII Art — Poop + flood
clear_screen
show_ascii_art poop
sleep 2
hack_flood 5

# Phase 9: Password cracking (25s)
clear_screen; printf "\n"
password_crack 25

# Phase 10: Traceroute + network graph
clear_screen; printf "\n"
printf "  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
printf "  ${CBORDER}║${RESET} ${CALERT}${BOLD} TRACEROUTE TO C2 — МАРШРУТ К СЕРВЕРУ — 追踪路由 ${HACK_ICON}${RESET}${CBORDER}            ║${RESET}\n"
printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"
traceroute_sim "185.234.218.42"
show_network_graph
sleep 2

# Phase 11: ASCII Art — Ghost + flood
clear_screen
show_ascii_art ghost
sleep 2
hack_flood 5

# Phase 12: Decryption (25s)
clear_screen; printf "\n"
decrypt_phase 25

# Phase 13: Netstat connections
clear_screen; printf "\n"
printf "  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
printf "  ${CBORDER}║${RESET} ${CALERT}${BOLD} ACTIVE CONNECTIONS — АКТИВНЫЕ СОЕДИНЕНИЯ — 活动连接 ${HACK_ICON}${RESET}${CBORDER}        ║${RESET}\n"
printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"
netstat_sim 15
show_network_graph
sleep 2

# Phase 14: ASCII Art — Kiss heart + flood
clear_screen
show_ascii_art kiss
sleep 2
hack_flood 5

# Phase 15: Surveillance (18s)
clear_screen; printf "\n"
surveillance_phase 18

# Phase 16: Ping to Moscow/Beijing/Helsinki
clear_screen; printf "\n"
printf "  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
printf "  ${CBORDER}║${RESET} ${C2}${BOLD} C2 LATENCY CHECK — ПРОВЕРКА СВЯЗИ С ЦУ — C2延迟检测 ${HACK_ICON}${RESET}${CBORDER}       ║${RESET}\n"
printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"
printf "  ${CALERT}>>> MOSCOW C2 SERVER / МОСКОВСКИЙ СЕРВЕР / 莫斯科服务器${RESET}\n"
ping_sim "185.234.218.42" 5
printf "  ${CALERT}>>> BEIJING RELAY / ПЕКИНСКИЙ РЕТРАНСЛЯТОР / 北京中继站${RESET}\n"
ping_sim "103.224.182.250" 5
printf "  ${CALERT}>>> HELSINKI NODE / ХЕЛЬСИНКСКИЙ УЗЕЛ / 赫尔辛基节点${RESET}\n"
ping_sim "91.215.85.17" 5
show_network_graph
sleep 2

# Phase 17: ASCII Art — Devil + flood
clear_screen
show_ascii_art devil
sleep 2
hack_flood 5

# Phase 18: Taunt scroll (15s)
clear_screen
taunt_scroll 15

# Phase 19: ASCII Art — Spider + flood
clear_screen
show_ascii_art spider
sleep 2
hack_flood 5

# Phase 20: Data exfiltration (20s)
clear_screen; printf "\n"
exfil_phase 20

# Phase 21: Traceroute to dark web + graph
clear_screen; printf "\n"
printf "  ${CBORDER}╔══════════════════════════════════════════════════════════════╗${RESET}\n"
printf "  ${CBORDER}║${RESET} ${CALERT}${BOLD} DARKNET ROUTE — МАРШРУТ В ДАРКНЕТ — 暗网路由 ${HACK_ICON}${RESET}${CBORDER}               ║${RESET}\n"
printf "  ${CBORDER}╚══════════════════════════════════════════════════════════════╝${RESET}\n\n"
traceroute_sim "45.133.1.81"
netstat_sim 10
show_network_graph
sleep 2

# Phase 22: ASCII Art — Alien + flood
clear_screen
show_ascii_art alien
sleep 2
hack_flood 5

# Phase 23: ASCII Art — Pirate + flood
clear_screen
show_ascii_art pirate
sleep 2
hack_flood 5

# Phase 24: Ransomware (15s)
clear_screen; printf "\n"
ransomware_phase 15

# Phase 25: ASCII Art — Bomb + flood
clear_screen
show_ascii_art bomb
sleep 2
hack_flood 5

# Phase 26: Matrix rain (8s)
clear_screen
matrix_rain 8

# Phase 27: Final skull + warning + flood
clear_screen
show_ascii_art skull
sleep 1
final_warning
sleep 2
hack_flood 8

# Hold
get_size
printf "\033[$((ROWS));1H${DIM}${C1}  [Press any key to terminate connection...]${RESET}"
read -n 1 -s
exit 0
