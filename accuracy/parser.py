#!/usr/bin/env python3

import sys

def parse(filename) :

    f = open(filename, "r")

    cnt = 0
    first = None

    for line in f :

        if cnt >= 23000 :
            return

        if "TIMESTAMP" in line :

            cnt += 1
            if cnt <= 5000 :
                continue

            tstamp = int(line.strip().split(":")[1])

            if tstamp == 0 :
                print(0)
                continue

            if "SW" in line :
                tstamp *= 1000

            if not first :
                first = tstamp
                
            print(tstamp - first)



if __name__ == "__main__" :

    parse(sys.argv[1])
