# OSS Audit Project — Princi Singh (Reg. No: 24MEI10140)

Welcome to the Open Source Software (OSS) Audit project.  
This project demonstrates a series of Bash scripts that inspect, analyze, and report on system software, packages, permissions, logs, and generates an interactive manifesto.  

All scripts are **fully executable from the terminal** in a Linux environment. No GUI setup is required.


## 🟢 Project Overview

This repository contains **5 Bash scripts**:

1. `script1.sh` — **System Identity Report**  
   Collects and displays system information including OS, kernel, uptime, user info, and licenses of chosen software.

2. `script2.sh` — **FOSS Package Inspector**  
   Checks if a chosen FOSS package (Python3) is installed, shows its version, license, binary location, and prints a philosophy note.

3. `script3.sh` — **Disk and Permission Auditor**  
   Loops through key system directories, reports permissions, ownership, disk usage, and audits Python installation directories.

4. `script4.sh` — **Log File Analyzer**  
   Reads a log file, searches for a keyword (default: `python`), counts occurrences, shows first 10 matches and last 5 matches, and prints a summary.

5. `script5.sh` — **Open Source Manifesto Generator**  
   Interactively asks 3 questions and generates a personalized OSS manifesto saved to a `.txt` file.


## 🟢 Prerequisites

- A **Linux environment** (Ubuntu recommended)  
- Bash shell (default on Linux)  
- Python3 installed (for scripts inspecting Python package)  
- Git installed for repository management  

Check Python installation:

```bash
python3 --version

🟢 Setup Instructions
Clone the repository or copy all scripts to a folder:

git clone https://github.com/YOUR_USERNAME/oss-audit-24MIP10158.git
cd oss-audit-24MIP10158

oss-audit-24MIP10158/
│
├── script1.sh       # System Identity Report
├── script2.sh       # FOSS Package Inspector
├── script3.sh       # Disk and Permission Auditor
├── script4.sh       # Log File Analyzer
├── script5.sh       # Open Source Manifesto Generator
└── README.md        # Project overview, setup, and execution instructions 
Make all scripts executable:
chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh


🟢 Running the Scripts

All scripts are fully executable from the terminal.

Step 1: System Identity Report
./script1.sh

Step 2: FOSS Package Inspector
./script2.sh


Step 3: Disk and Permission Auditor
./script3.sh


Step 4: Log File Analyzer
./script4.sh



By default, searches /var/log/dpkg.log for keyword python.
You can specify a log file and keyword:

./script4.sh /path/to/logfile keyword


Step 5: Open Source Manifesto Generator
./script5.sh



Interactive script; it will prompt for 3 answers and generate manifesto_kriti.txt




🟢 Project Execution Flow
Run script1.sh to see system identity and software license info.
Run script2.sh to inspect the Python3 package.
Run script3.sh to audit system directories and Python installation.
Run script4.sh to analyze log files for relevant keywords.
Run script5.sh to create a personalized manifesto for OSS contribution.

All outputs are displayed in the terminal, with script5.sh generating a .txt file for the manifesto.

Repository Setup

To push updates or new scripts to GitHub:
git init
git add .
git commit -m "OSS Audit Project — Kritika Karma 24MIP10158"
git remote add origin https://github.com/kritikarma2007/oss-audit-24MIP10158.git
git branch -M main
git push -u origin main
  
  
Notes
Scripts are self-contained, no external libraries required.
Default paths and keywords are included for convenience (/var/log/dpkg.log and python).
Proper permissions may require sudo when accessing system directories.   
   
 
 
Author

Princi Singh
Registration No: 24MEI10140
Course: Open Source Software (OSS)
Date: March 2026
