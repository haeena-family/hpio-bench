#!/usr/bin/env python3

import sys

def parse(filename) :

    f = open(filename, "r")

    first = None

    timestamps = []
    for line in f :

        if "TIMESTAMP" in line :

            tstamp = int(line.strip().split(":")[1])
            if tstamp == 0 :
                continue

            if "SW" in line :
                tstamp *= 1000

            timestamps.append(tstamp)

    timestamps.sort()

    for x in range(1000, 10000) :
        print(timestamps[x] - timestamps[x - 1])


if __name__ == "__main__" :

    parse(sys.argv[1])
