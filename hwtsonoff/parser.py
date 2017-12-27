#!/usr/bin/env python

import sys


def parse(filename) :

    f = open(filename, 'r')

    # gather
    mpps_list = []
    for line in f :
        if "SUM" in line :
            mpps_list.append(int(line.split(" ")[1]))

    return mpps_list

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

    maximum = max(mpps_list) / 1000000
    minimum = min(mpps_list) / 1000000
    median = med(mpps_list) / 1000000

    print("%s\t%f\t%f\t%f" % (title, median, minimum, maximum))
