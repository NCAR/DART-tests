#!/usr/bin/env python3

import sys
import os
from glob import glob
from collections import defaultdict

def check_duplicates(file_path, verbose=False):
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
        if verbose:
            print(f"No duplicate lines containing 'QTY' found in {file_path}.")

def check_duplicates_in_directory(directory_path, verbose=False):
    # Check if the directory exists
    if not os.path.isdir(directory_path):
        print(f"Error: Directory '{directory_path}' does not exist.")
        sys.exit(1)
    pattern = os.path.join(directory_path, '*quantities_mod.f90')
    files = glob(pattern)
    default_file = os.path.join(directory_path, 'default_quantities_mod.f90')
    if not files:
        print(f"No files matching the pattern '*quantities_mod.f90' found in {directory_path}.")
        return
    if not os.path.isfile(default_file):
        print(f"Error: default_quantities_mod.f90 not found in {directory_path}.")
        return
    # Gather all QTYs from default_quantities_mod.f90
    with open(default_file, 'r') as f:
        default_qtys = set()
        for line in f:
            line = line.strip()
            if line.startswith('!'):
                line = line[1:].strip()
            if line.startswith('QTY_'):
                qty = line.split()[0]
                default_qtys.add(qty)
    # Check each file for duplicates and missing QTYs
    for file_path in files:
        if file_path == default_file:
            continue
        check_duplicates(file_path, verbose=verbose)
        with open(file_path, 'r') as f:
            file_qtys = set()
            for line in f:
                line = line.strip()
                if line.startswith('!'):
                    line = line[1:].strip()
                if line.startswith('QTY_'):
                    qty = line.split()[0]
                    file_qtys.add(qty)
            missing = file_qtys - default_qtys
            if missing:
                print(f"QTYs in {os.path.basename(file_path)} missing from default_quantities_mod.f90:")
                for qty in sorted(missing):
                    print(f"  {qty}")
            else:
                if verbose:
                    print(f"All QTYs in {os.path.basename(file_path)} are present in default_quantities_mod.f90.")

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Check for duplicate QTYs and missing QTYs in *_quantities_mod.f90 files.")
    parser.add_argument("directory_path", help="Directory containing *_quantities_mod.f90 files")
    parser.add_argument("-v", "--verbose", action="store_true", help="Print passing messages as well as failures")
    args = parser.parse_args()
    check_duplicates_in_directory(args.directory_path, verbose=args.verbose)
