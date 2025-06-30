# Iran Internet Censorship Tester

A powerful and comprehensive diagnostic tool designed to detect internet censorship, DNS manipulation, and protocol blocking in Iran or any heavily filtered environment.

## 🌍 Purpose

This script helps you check:
- Internet connectivity
- DNS hijacking and leaks
- Website blocking (Signal, Tor, Telegram, etc.)
- DoH support (DNS-over-HTTPS)
- Port filtering for VPN/Tor
- SNI censorship
- QUIC/UDP protocol filtering
- Geolocation and IP information
- Speed and ICMP fragmentation
- Tor bridge (Meek) reachability

## 🧩 Features

- 13 modular tests (each can be run separately)
- Interactive menu-based interface
- Designed for Android + Termux or Linux
- Lightweight and fast
- No root required

## ✅ How to Install & Use

### 1. Install Termux (if on Android)
[https://f-droid.org/en/packages/com.termux/](https://f-droid.org/en/packages/com.termux/)

### 2. Update Termux and install required packages:

```bash
pkg update && pkg install curl dnsutils openssl python -y

3. Download the script:

curl -O https://raw.githubusercontent.com/pars1500/Iran-internet-censorship-tester/main/net_test.sh
chmod +x net_test.sh

4. Run the script:

./net_test.sh

You'll see a menu with 13 test options + a full test.

📷 Screenshot

📡 Internet Censorship Test Menu
--------------------------------------
1) Check Internet Connectivity
2) Check for DNS Hijacking
3) Check Blocked Websites
4) Check VPN/Tor Ports
5) Test DNS-over-HTTPS (DoH)
6) Global Domain Reachability Test
7) Advanced DNS Leak Test
8) TLS SNI Censorship Detection
9) ICMP Fragmentation Check
10) Run Speed Test
11) Check QUIC Protocol
12) Exit IP and Geolocation
13) Test Tor Meek Bridge
14) Run All Tests

🛡 License

MIT License © pars1500

