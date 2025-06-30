#!/data/data/com.termux/files/usr/bin/bash

# ==========================
# Full Internet Censorship Diagnostic Tool
# Author: pars1500 (GitHub)
# License: MIT
# ==========================

# ---- Color functions ----
green() { echo -e "\033[32m$1\033[0m"; }
red()   { echo -e "\033[31m$1\033[0m"; }

# 1. Check Internet connectivity
check_internet() {
  echo -e "\n🌐 Internet Connectivity:"
  ping -c 1 1.1.1.1 >/dev/null 2>&1 && green "✅ Internet is reachable" || red "❌ No Internet connection"
}

# 2. Check for DNS Hijacking
check_dns_hijack() {
  echo -e "\n🔍 DNS Hijack Detection:"
  ip=$(dig @1.1.1.1 torproject.org +short | head -n 1)
  if [[ $ip == 10.* || $ip == 127.* || -z "$ip" ]]; then
    red "⚠️ Potential DNS Hijack Detected (IP: $ip)"
  else
    green "✅ DNS appears clean (IP: $ip)"
  fi
}

# 3. Test access to blocked websites
check_sites() {
  echo -e "\n🌐 Blocked Websites Check:"
  sites=(torproject.org t.me signal.org mullvad.net protonvpn.com v2ray.com psiphon.ca)
  for site in "${sites[@]}"; do
    code=$(curl -Is --max-time 5 https://$site | head -n 1)
    if [[ $code == *"200"* || $code == *"301"* || $code == *"302"* ]]; then
      green "$site ✅ Accessible"
    else
      red "$site ❌ Blocked or Unreachable"
    fi
  done
}

# 4. Check common VPN/Tor ports
check_ports() {
  echo -e "\n📡 VPN/Tor Port Availability:"
  for port in 443 80 1194 51820 8388 9001 853; do
    (echo > /dev/tcp/1.1.1.1/$port) >/dev/null 2>&1 && green "Port $port ✅ Open" || red "Port $port ❌ Blocked"
  done
}

# 5. DNS over HTTPS (DoH) test
check_doh() {
  echo -e "\n🔐 DNS-over-HTTPS (DoH) Test:"
  resp=$(curl -s -w "\nCode: %{http_code}\n" "https://dns.google/resolve?name=example.com&type=A")
  if echo "$resp" | grep -q "Code: 200"; then
    green "✅ DoH is working"
  else
    red "❌ DoH is not available or blocked"
  fi
}

# 6. Check global domains
check_global_domains() {
  echo -e "\n🌍 Global Internet Domains Check:"
  domains=(google.com cloudflare.com github.com openai.com mozilla.org amazon.com facebook.com wikipedia.org)
  for domain in "${domains[@]}"; do
    status=$(curl -Is --max-time 5 https://$domain | head -n 1)
    if [[ $status == *"200"* || $status == *"301"* || $status == *"302"* ]]; then
      green "$domain ✅ Reachable"
    else
      red "$domain ❌ Blocked or Unreachable"
    fi
  done
}

# 7. Advanced DNS leak detection
check_dns_leak() {
  echo -e "\n🧠 Advanced DNS Leak Test:"
  resolvers=("1.1.1.1: Cloudflare" "8.8.8.8: Google" "9.9.9.9: Quad9" "208.67.222.222: OpenDNS")
  for entry in "${resolvers[@]}"; do
    ip=$(echo "$entry" | cut -d':' -f1)
    name=$(echo "$entry" | cut -d':' -f2-)
    result=$(dig @$ip example.com +short | head -n 1)
    if [[ -z "$result" || "$result" == 10.* || "$result" == 127.* ]]; then
      red "$name ($ip) ❌ Suspicious or Hijacked (Response: $result)"
    else
      green "$name ($ip) ✅ Resolved to $result"
    fi
  done
}

# 8. TLS SNI censorship detection
check_tls_sni() {
  echo -e "\n🔐 TLS SNI Censorship Check:"
  site="openai.com"
  output=$(openssl s_client -connect ${site}:443 -servername ${site} < /dev/null 2>&1)
  echo "$output" | grep -q "CONNECTED" && green "✅ TLS connection to $site succeeded" || red "❌ TLS blocked or intercepted"
}

# 9. ICMP fragmentation test
check_icmp_frag() {
  echo -e "\n📦 ICMP Fragmentation Test:"
  ping -s 2000 -c 3 1.1.1.1 >/dev/null 2>&1 && green "✅ Large ICMP packets allowed" || red "❌ Large ICMP packets blocked"
}

# 10. Speed test using Python script
check_speed() {
  echo -e "\n📶 Speed Test:"
  curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python
}

# 11. Check QUIC (UDP/443)
check_quic() {
  echo -e "\n⚡ QUIC Protocol Check (UDP/443):"
  result=$(timeout 5 bash -c 'echo | nc -u -w2 www.google.com 443' 2>&1)
  [[ $? -eq 0 ]] && green "✅ QUIC seems reachable" || red "❌ QUIC may be blocked"
}

# 12. Show current IP and geolocation
check_geo() {
  echo -e "\n🌎 Exit IP Geolocation:"
  geo=$(curl -s ipinfo.io)
  [[ -n "$geo" ]] && echo "$geo" || red "❌ Could not fetch IP info"
}

# 13. Test Tor meek bridge
check_tor_bridges() {
  echo -e "\n🛡️ Tor Bridge Test (Meek):"
  bridge="meek.azureedge.net"
  curl -Is --max-time 7 https://$bridge | head -n 1 | grep -q "HTTP" && green "✅ meek bridge reachable" || red "❌ meek bridge blocked"
}

# Master function to run all
run_all() {
  clear
  echo "🧪 Full Internet Censorship Diagnostic"
  echo "🕒 Date: $(date)"
  echo "----------------------------------------"
  check_internet
  check_dns_hijack
  check_sites
  check_ports
  check_doh
  check_global_domains
  check_dns_leak
  check_tls_sni
  check_icmp_frag
  check_speed
  check_quic
  check_geo
  check_tor_bridges
  echo -e "\n✅ Full diagnostic completed."
}

# --------------------------
# Main interactive menu
# --------------------------
echo -e "\n📡 Internet Censorship Test Menu"
echo "--------------------------------------"
echo "1) Check Internet Connectivity"
echo "2) Check for DNS Hijacking"
echo "3) Check Blocked Websites"
echo "4) Check VPN/Tor Ports"
echo "5) Test DNS-over-HTTPS (DoH)"
echo "6) Global Domain Reachability Test"
echo "7) Advanced DNS Leak Test"
echo "8) TLS SNI Censorship Detection"
echo "9) ICMP Fragmentation Check"
echo "10) Run Speed Test"
echo "11) Check QUIC Protocol"
echo "12) Exit IP and Geolocation"
echo "13) Test Tor Meek Bridge"
echo "14) Run All Tests"
echo -n "Select option [1-14]: "
read opt

case $opt in
  1) check_internet ;;
  2) check_dns_hijack ;;
  3) check_sites ;;
  4) check_ports ;;
  5) check_doh ;;
  6) check_global_domains ;;
  7) check_dns_leak ;;
  8) check_tls_sni ;;
  9) check_icmp_frag ;;
 10) check_speed ;;
 11) check_quic ;;
 12) check_geo ;;
 13) check_tor_bridges ;;
 14) run_all ;;
  *) echo "❌ Invalid option";;
esac
