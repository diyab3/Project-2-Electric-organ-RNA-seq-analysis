#!/usr/bin/env python

import argparse

def get_args():
    parser = argparse.ArgumentParser(description="A program to introduce yourself")
    parser.add_argument("-i", "--input", help="Name of the input fasta file", type=str, default="")
    #parser.add_argument("-o", "--output", help="Name of the output file", type=str, default="")
    return parser.parse_args()

args = get_args()

# SECONDARY ALIGNMENT BITWISE FLAG: only want to count primary aligned because those are the best alignment for that read

mapped = True
mapped_counter = 0
unmapped_counter = 0
with open(args.input, "r") as sam:
    for line in sam:
        line = line.strip()
        if not line.startswith("@"):
            line_elements = line.split("\t")
            #print(line_elements[1])
            flag = int(line_elements[1])
            if ((flag & 256) != 256):
                # our read is not a secondary alignment aka is a primary alignment

                if((flag & 4) != 4):
                    mapped = True
                    mapped_counter += 1
                else:
                    mapped = False
                    unmapped_counter += 1

print(f"Number mapped reads: {mapped_counter}")
print(f"Number unmapped reads: {unmapped_counter}")