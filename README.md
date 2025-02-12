# Google Sheet Change Monitor with Slack Notifications

This script monitors a **Google Sheet (CSV format)** for any changes and sends a **Slack notification** when new data is detected.  

## 🚀 Features
- **Monitors Google Sheets CSV URL** for changes  
- **Uses hashing (`md5sum`) to detect changes accurately**  
- **Avoids false positives from whitespace or formatting changes**  
- **Sends a Slack notification** with a link to the sheet when a change is detected  
- **Runs continuously, checking for updates every 5 seconds**  

---

## 🛠️ Prerequisites
- **Linux/macOS** with `bash`, `wget`, `curl`, and `md5sum` installed  
- A **Slack Webhook URL** (Get it from your Slack workspace: [Slack Incoming Webhooks](https://api.slack.com/messaging/webhooks))  

---

## 📌 Setup Instructions

### **1️⃣ Clone or Download the Script**
```bash
git clone https://github.com/your-repo/google-sheet-monitor.git
cd google-sheet-monitor
