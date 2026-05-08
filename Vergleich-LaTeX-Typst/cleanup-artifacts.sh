#!/bin/bash

# Deletes all temporary (LaTeX) artifacts.
#
# The script has to be executable. On Mac & Linux run:
# chmod +x cleanup-artifacts.sh
#
# To run/execute the script:
# ./cleanup-artifacts.sh

set -o errexit
set -o nounset
set -o pipefail

files=(
    "*.aux"
    "*.bbl"
    "*.bbl-SAVE-ERROR"
    "*.bcf"
    "*.bcf-SAVE-ERROR"
    "*.blg"
    "*.fdb_latexmk"
    "*.fls"
    "*.log"
    "*.out"
    "*.run.xml"
    "*.synctex.gz"
    "Leitfaden.txt"
    "README.txt"
    "Themenskizze.txt"
)

# Search for the artifact files, print their filepaths and delete them.
for file in "${files[@]}"; do
    find . -type f -name "$file" | while read filepath; do
        echo "Delete: $filepath";
        rm -f "$filepath";
    done
done

echo "Done"
