#!/usr/bin/env python

import sys

def parse(filename) :

    f = open(filename, 'r')

    q = {} # { qnum: [ val, val, val ...] }

    # gather
    for line in f :
        if "Pkt Count" in line :
            mpps = float(line.split(' ')[3])
            qnum = int(line.split(' ')[1].split(':')[2][:-1])
            if not qnum in q :
                q[qnum] = []
            q[qnum].append(mpps)

    # calculate
    mpps_sum_list = []
    for x in range(len(q[0])) :
        mpps_sum = 0.0
        for qnum, mpps_list in q.items() :
            mpps_sum += mpps_list[x]
        mpps_sum_list.append(mpps_sum)

    return mpps_sum_list

if __name__ == "__main__" :
    mpps_list = parse(sys.argv[1])
    mpps_list.sort()
    print(mpps_list)
    print(mpps_list[len(mpps_list) / 2])
