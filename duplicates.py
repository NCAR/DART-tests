#!/usr/bin/env python3

import sys
import os
from glob import glob
from collections import defaultdict

def check_duplicates(file_path):
    line_count = defaultdict(int)
    
    with open(file_path, 'r') as file:
        for line in file:
            stripped_line = line.strip()
            if "QTY" in stripped_line:
                line_count[stripped_line] += 1
    
    duplicates = {line: count for line, count in line_count.items() if count > 1}
    
    if duplicates:
        print(f"Duplicate lines containing 'QTY' found in {file_path}:")
        for line, count in duplicates.items():
            print(f"{line} (appears {count} times)")
    else:
        print(f"No duplicate lines containing 'QTY' found in {file_path}.")

def check_duplicates_in_directory(directory_path):
    # Check if the directory exists
    if not os.path.isdir(directory_path):
        print(f"Error: Directory '{directory_path}' does not exist.")
        sys.exit(1)
    pattern = os.path.join(directory_path, '*quantities_mod.f90')
    files = glob(pattern)
    
    if not files:
        print(f"No files matching the pattern '*quantities_mod.f90' found in {directory_path}.")
        return
    
    for file_path in files:
        check_duplicates(file_path)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python check_duplicates.py <directory_path>")
        sys.exit(1)
    
    directory_path = sys.argv[1]
    check_duplicates_in_directory(directory_path)
