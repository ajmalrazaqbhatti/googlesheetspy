# Google Sheet Change Monitor with Slack Notifications

This script monitors a **Google Sheet (CSV format)** for any changes and sends a **Slack notification** when new data is detected.

---

## 🚀 Features
- ✅ **Monitors Google Sheets for changes without using Google API (100% free)**
- ✅ **Detects new data in a published CSV file**
- ✅ **Sends Slack notifications when changes are found**
- ✅ **Runs on GitHub Actions for free, no server needed**
- ✅ **Lightweight and cost-free deployment**

---

## 📌 Setup & Usage

### **1️⃣ Publish Your Google Sheet as a CSV**
1. Open your **Google Sheet**  
2. Click **File > Share > Publish to Web**  
3. Select **CSV format** and copy the link  

---

### **2️⃣ Deploy the Script on Your GitHub (Using Actions)**
#### ✅ **Automatic Monitoring Without a Server**

1. **Fork This Repository**  
   - Click the **Fork** button on GitHub to create your own copy.  

2. **Enable GitHub Actions**  
   - Go to the **Actions** tab in your forked repo.  
   - Click **Enable Actions** if prompted.  

3. **Add Your Google Sheet URL & Slack Webhook as Repository Secrets**  
   - Go to **Settings > Secrets and Variables > Actions**  
   - Click **New Repository Secret**  
   - Add the following secrets:  
     - `SHEET_CSV_URL`: _(Paste your Google Sheet CSV URL)_  
     - `SLACK_WEBHOOK_URL`: _(Paste your Slack webhook URL)_  

4. **Move the GitHub Actions Workflow File**  
   - The `.yml` file is already available in the repository.  
   - Move the file to `.github/workflows/monitor.yml` in your repository.  

5. **Commit & Push the Changes**  
   - Save the file and push it to your repository.  

6. **Your script will now run every 5 minutes! 🎉**  

---

### **✅ Alternative: Run on Your Own Machine*

**Download and run manually**
   ```bash
   chmod +x monitor_sheet_slack.sh
   ./monitor_sheet_slack.sh
   ```
## 📜 License
MIT License © 2025 Ajmal Razaq Bhatti  

