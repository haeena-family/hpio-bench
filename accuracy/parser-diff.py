#!/usr/bin/env python3

import sys

def parse(filename) :

    f = open(filename, "r")

    cnt = 0
    before = None

    for line in f :

        if cnt > 2000 :
            return

        if "TIMESTAMP" in line :

            cnt += 1
            if cnt < 1000 :
                continue

            tstamp = int(line.strip().split(":")[1])

            if "SW" in line :
                tstamp *= 1000
                
            if not before :
                before = tstamp

                
            print(tstamp - before)
            before = tstamp


if __name__ == "__main__" :

    parse(sys.argv[1])
