#!/usr/bin/env python
import sys
if len(sys.argv != 6):
    sys.exit('USAGE: python bin_coverage.py samp bin idxstats read_length output')

read_length = int(sys.argv[4])
idxstats = sys.argv[3]
output = sys.argv[5]
bin = sys.argv[2]
samp = sys.argv[1]

with open(idxstats, 'r') as statsf:
	stats = [l.strip().split("\t") for l in statsf.readlines()]

total_contig_bases = sum([int(i[1]) for i in stats])
total_reads = sum([int(i[2]) for i in stats])
total_read_bases = total_reads * read_length

avg_cov = total_read_bases / total_contig_bases

with open(output, 'w') as outf:
	outf.write("\t".join([samp, bin, str(avg_cov)]) + "\n")
