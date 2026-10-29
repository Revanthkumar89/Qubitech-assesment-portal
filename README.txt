QUBITECH CANDIDATE ASSESSMENT APP

What this does
- Candidates see only their name/contact fields, four questions, and a Submit button.
- No candidate-facing score or rubric is shown.
- Each submission is automatically appended to candidate_responses.xlsx on the computer running the app.
- The Excel file updates when candidates submit; no printing or manual copying is needed.

SETUP (Windows)
1. Install Python 3.10 or newer from https://www.python.org/downloads/
2. Extract this ZIP into a folder.
3. Open Command Prompt in that folder.
4. Run:  py -m pip install -r requirements.txt
5. Set an admin password (recommended):
   set QUBITECH_ADMIN_PASSWORD=choose-a-strong-password
6. Start the app:
   py app.py
7. On the host computer, open http://127.0.0.1:5000 to test.
8. For candidates on the SAME Wi-Fi/LAN, find the host computer's local IPv4 address by running `ipconfig` in Command Prompt. Share:
   http://YOUR-IP-ADDRESS:5000
   Example format only: http://192.168.1.20:5000
   Allow Python through Windows Firewall on private networks if prompted.

DOWNLOAD RESPONSES
- Responses are automatically stored in candidate_responses.xlsx in this folder.
- Open that workbook after submissions; close it before more submissions if Excel locks the file.
- Alternatively, download from the host computer using:
  http://127.0.0.1:5000/admin?key=YOUR_ADMIN_PASSWORD
  Replace YOUR_ADMIN_PASSWORD with the password you set.

IMPORTANT LIMITATIONS / SECURITY
- This is designed for a local interview room or trusted private Wi-Fi network.
- Do not expose this development server directly to the public internet. Public use needs proper hosting, HTTPS, access controls, privacy notice, backups, and production hardening.
- If candidates are not on the same Wi-Fi/LAN, deploy it to a secure hosting service before the interview.
- Change the default admin password and Flask secret key before use.
- Back up the Excel file after interviews.
