#!/usr/bin/env python3

import sys
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
        print("Duplicate lines containing 'QTY' found:")
        for line, count in duplicates.items():
            print(f"{line} (appears {count} times)")
    else:
        print("No duplicate lines containing 'QTY' found.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python check_duplicates.py <file_path>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    check_duplicates(file_path)