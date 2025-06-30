# ✅ Iran Internet Censorship Tester

A full diagnostic tool for checking internet censorship, DNS manipulation, and VPN/Tor accessibility in Iran.

---

## ✅ Features

- Detects DNS hijacking and leaks
- Checks access to popular blocked sites
- Tests VPN and Tor-related ports
- Verifies DNS-over-HTTPS (DoH)
- Assesses global internet domain reachability
- Advanced TLS/SNI, QUIC, ICMP, and speed tests
- Tor Bridge (Meek/Obfs4) connectivity check
- Works directly inside Termux on Android
- No root required

---

## ✅ How to Install & Use

### 1. Install Termux (if on Android)

📥 Download Termux from F-Droid:  
[https://f-droid.org/en/packages/com.termux/](https://f-droid.org/en/packages/com.termux/)

---

### 2. Update Termux and install required packages

```bash
pkg update && pkg install curl wget openssl dnsutils inetutils coreutils -y
