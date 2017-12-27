#!/usr/bin/env python3

import sys

def pdf(filename):
	f = open(filename, "r")

	c = dict()
	len = 0

	for line in f:
		l = int(line.rstrip())

		if not l in c.keys():
			c[l] = 0
		c[l] = c[l] + 1

		len = len + 1

	for k, v in sorted(c.items()):
		if k != 0:
			print(k, round((v / len), 3))

if __name__ == "__main__" :
    pdf(sys.argv[1])

