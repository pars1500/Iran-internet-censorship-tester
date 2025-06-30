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





---

3. Download the script

curl -O https://raw.githubusercontent.com/pars1500/Iran-internet-censorship-tester/main/net_test.sh
chmod +x net_test.sh


---

4. Run the script

./net_test.sh

You'll see a menu with 13 powerful test options.


---

📸 Menu Screenshot

🛰️ Internet Censorship Test Menu
--------------------------------
1) Check Internet Connectivity
2) Check for DNS Hijacking
3) Check Blocked Websites
4) Check VPN/Tor Ports
5) Test DNS-over-HTTPS (DoH)
6) Global Domain Reachability Test
7) Advanced DNS Leak Test
8) TLS SNI Censorship Detection
9) ICMP Fragmentation Check
10) Speed Test (Bandwidth)
11) QUIC Protocol Check
12) Check Exit IP Location
13) Tor Obfs4/Meek Test
14) Run Full Diagnostic


---

🔐 Example Use Cases

Check if your ISP is hijacking DNS

Detect whether VPN protocols are blocked

Verify if global domains are reachable

Check speed and international routing quality

Test Tor bridge availability in censored networks



---

👤 Author

Made with ❤️ by pars1500
Feel free to open issues or suggestions.


---

✅ License

This tool is released under the MIT License.

---
