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

def med(a) :

    if len(a) % 2 == 0:
        mid_a = a[(len(a) / 2)]
        mid_b = a[len(a) / 2 + 1]
        return (mid_a + mid_b) / 2.0
    else :
        return a[(len(a) - 1) / 2 + 1]
        


if __name__ == "__main__" :

    try :
        title = sys.argv[1]
        filename = sys.argv[2]
    except :
        print("usage: %s [TITLE] [FILENAME]" % sys.argv[0])
        exit(1)
        
    mpps_list = parse(filename)
    mpps_list.sort()

    maximum = max(mpps_list)
    minimum = min(mpps_list)
    median = med(mpps_list)

    print("%s\t%f\t%f\t%f" % (title, median, minimum, maximum))
