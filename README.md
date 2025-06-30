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
