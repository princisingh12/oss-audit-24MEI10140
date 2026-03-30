#!/bin/bash
# ============================================================
# Combined Audit Script: System Identity + FOSS Inspector
# Author: Princi Singh | Reg No: 24MEI10140
# Course: Open Source Software
# Purpose: Displays system info and inspects FOSS package
# ============================================================

# ----------------- SYSTEM IDENTITY -----------------
STUDENT_NAME="Princi Singh"    
SOFTWARE_CHOICE="Python"           
LICENSE_NAME="PSF License (Python Software Foundation License)"

# Collect system information
DISTRO=$(lsb_release -d | cut -f2)
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p)
CURRENT_DATE=$(date '+%d %B %Y')
CURRENT_TIME=$(date '+%H:%M:%S')

# Display System Identity Report
echo "============================================================"
echo "       OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT"
echo "============================================================"
echo ""
echo "  Student Name    : $STUDENT_NAME"
echo "  Chosen Software : $SOFTWARE_CHOICE"
echo ""
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Linux Distro    : $DISTRO"
echo "  Kernel Version  : $KERNEL"
echo "  Logged In User  : $USER_NAME"
echo "  Home Directory  : $HOME_DIR"
echo "  System Uptime   : $UPTIME"
echo "  Date            : $CURRENT_DATE"
echo "  Time            : $CURRENT_TIME"
echo ""
echo "------------------------------------------------------------"
echo "  OPEN SOURCE LICENSE INFO"
echo "------------------------------------------------------------"
echo "  This OS (Ubuntu) is licensed under:"
echo "  GNU General Public License v2 (GPL v2)"
echo ""
echo "  Our chosen software Python is licensed under:"
echo "  $LICENSE_NAME"
echo ""
echo "  Both licenses guarantee the four freedoms:"
echo "  1. Freedom to run the program"
echo "  2. Freedom to study and modify the source"
echo "  3. Freedom to redistribute copies"
echo "  4. Freedom to distribute modified versions"
echo ""
echo "============================================================"
echo ""

# ----------------- FOSS PACKAGE INSPECTOR -----------------
PACKAGE="python3"

echo "============================================================"
echo "         FOSS PACKAGE INSPECTOR"
echo "============================================================"
echo ""
echo "  Inspecting package: $PACKAGE"
echo ""

if dpkg -s $PACKAGE &>/dev/null; then
    echo "  [STATUS] $PACKAGE is INSTALLED on this system."
    echo ""

    VERSION=$(dpkg -s $PACKAGE | grep -E '^Version' | awk '{print $2}')
    echo "  Version         : $VERSION"

    COPYRIGHT_FILE="/usr/share/doc/${PACKAGE}/copyright"
    if [ -f "$COPYRIGHT_FILE" ]; then
        LICENSE_LINE=$(grep -i "license" "$COPYRIGHT_FILE" | head -1)
        echo "  License Info    : $LICENSE_LINE"
    else
        echo "  License         : PSF License (Python Software Foundation)"
    fi

    BINARY_PATH=$(which python3)
    echo "  Binary Location : $BINARY_PATH"

    PY_VERSION=$(python3 --version 2>&1)
    echo "  Python Reports  : $PY_VERSION"
else
    echo "  [STATUS] $PACKAGE is NOT installed on this system."
    echo "  To install it, run: sudo apt install python3 -y"
fi

echo ""
echo "------------------------------------------------------------"
echo "  PHILOSOPHY NOTES — FOSS PACKAGES"
echo "------------------------------------------------------------"
echo ""

case $PACKAGE in
    python3)
        echo "  Python: A language built by community for community."
        echo "  Guido van Rossum shared it freely in 1991 so that"
        echo "  everyone — not just experts — could write software."
        ;;
    httpd | apache2)
        echo "  Apache: The web server that built the open internet."
        echo "  It powers nearly a third of all websites globally."
        ;;
    mysql-server)
        echo "  MySQL: Open source at the heart of millions of apps."
        echo "  Its dual-license model is a study in OSS economics."
        ;;
    firefox)
        echo "  Firefox: A nonprofit's fight for an open, free web."
        echo "  It exists to prove browsers need not be proprietary."
        ;;
    git)
        echo "  Git: Born in frustration when a proprietary tool"
        echo "  failed Linus Torvalds. Now used by every developer."
        ;;
    *)
        echo "  $PACKAGE: An open source tool contributing to the"
        echo "  shared foundation that all software builds upon."
        ;;
esac

echo ""
echo "============================================================"
echo "  Audit prepared by: $STUDENT_NAME | Reg No: 24MEI10140"
echo "============================================================"
