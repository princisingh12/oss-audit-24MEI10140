#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Princi Singh  | Reg No: 24MEI10140
# Course: Open Source Software | Chosen Software: Python
# Purpose: Reads a log file, counts keyword occurrences,
#          and prints a summary with matching lines
# Usage  : ./script4.sh [logfile] [keyword]
# Example: ./script4.sh /var/log/dpkg.log python
# ============================================================

# --- Accept log file path as first argument, default to /var/log/dpkg.log ---
LOGFILE=${1:-"/var/log/dpkg.log"}

# --- Accept keyword as second argument, default to "python" if not given ---
KEYWORD=${2:-"python"}

# --- Counters ---
COUNT=0
LINE_NUM=0

# --- Check if file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "============================================================"
    echo "  ERROR: File '$LOGFILE' not found."
    echo "  Please check the path and try again."
    echo "============================================================"
    exit 1
fi

# --- Check if file is empty ---
if [ ! -s "$LOGFILE" ]; then
    echo "  WARNING: The file '$LOGFILE' is empty."
    echo "  Exiting."
    exit 1
fi

echo "============================================================"
echo "         LOG FILE ANALYZER"
echo "============================================================"
echo ""
echo "  Log File  : $LOGFILE"
echo "  Keyword   : '$KEYWORD' (case-insensitive search)"
echo ""
echo "------------------------------------------------------------"
echo "  MATCHING LINES"
echo "------------------------------------------------------------"
echo ""

# --- Read file line by line ---
while IFS= read -r LINE; do
    LINE_NUM=$((LINE_NUM + 1))

    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))

        if [ $COUNT -le 10 ]; then
            echo "  Line $LINE_NUM: $LINE"
        fi
    fi

done < "$LOGFILE"

echo ""

if [ $COUNT -gt 10 ]; then
    echo "  ... and $((COUNT - 10)) more matching lines (showing first 10 only)"
    echo ""
fi

echo "------------------------------------------------------------"
echo "  LAST 5 MATCHING LINES (using grep + tail)"
echo "------------------------------------------------------------"
echo ""

grep -i --color=never "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r LASTLINE; do
    echo "  >> $LASTLINE"
done

echo ""
echo "------------------------------------------------------------"
echo "  SUMMARY"
echo "------------------------------------------------------------"
echo "  Total lines in file : $LINE_NUM"
echo "  Keyword searched    : '$KEYWORD'"
echo "  Total matches found : $COUNT"
echo ""

if [ $COUNT -eq 0 ]; then
    echo "  Result: No occurrences of '$KEYWORD' found in the log."
elif [ $COUNT -lt 5 ]; then
    echo "  Result: Few occurrences found — system looks healthy."
else
    echo "  Result: Multiple occurrences found — worth investigating."
fi

echo "============================================================"
echo "  Audit prepared by: Princi Singh | Reg No: 24MEI10140"
echo "============================================================"
