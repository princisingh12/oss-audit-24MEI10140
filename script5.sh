#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Princi Singh  | Reg No: 24MEI10140
# Course: Open Source Software | Chosen Software: Python
# Purpose: Asks the user 3 questions interactively and
#          generates a personalised open source manifesto,
#          then saves it to a .txt file
# ============================================================

# --- Get current date ---
DATE=$(date '+%d %B %Y')

# --- Output filename ---
OUTPUT="manifesto_$(whoami).txt"

echo "============================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR"
echo "============================================================"
echo ""
echo "  This script will create a personalised open source"
echo "  philosophy statement based on your answers."
echo ""
echo "------------------------------------------------------------"

# --- User input ---
read -p "  1. Name one open-source tool you use every day: " TOOL
echo ""

read -p "  2. In one word, what does 'freedom' mean to you?  " FREEDOM
echo ""

read -p "  3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Validation ---
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo "  ERROR: All three questions must be answered."
    exit 1
fi

echo ""
echo "  Generating your manifesto..."
echo ""

# --- Create manifesto file ---
echo "============================================================" > "$OUTPUT"
echo "  MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "  Generated on: $DATE" >> "$OUTPUT"
echo "  By: Princi Singh" >> "$OUTPUT"
echo "  Reg No: 24MEI10140" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "  Every day, I rely on $TOOL — a piece of software that" >> "$OUTPUT"
echo "  someone built and shared freely with the world." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "  To me, freedom means $FREEDOM. In software, it means" >> "$OUTPUT"
echo "  I can read, modify, and improve the code." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "  I commit that when I build $BUILD, I will share it" >> "$OUTPUT"
echo "  with others to support open collaboration." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "  Open source is not just code — it is a mindset of sharing." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "============================================================" >> "$OUTPUT"
echo "  Chosen Software: Python (PSF License)" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Show output ---
echo "  Your manifesto has been saved to: $OUTPUT"
echo ""
echo "------------------ YOUR MANIFESTO ------------------"
echo ""

cat "$OUTPUT"

echo ""
echo "============================================================"
echo "  Done. File saved as: $OUTPUT"
echo "============================================================"
