import sys
import operator

isTCP = False

ips = {}



def parseTCP(line):
    line = line.strip()
    parts = line.split(" ")
    return parts

def part1():    
    with open('trace.txt', 'r') as f:
        for line in f:
            if isTCP:
                parts = parseTCP(line)
                source, dest = parts[0], parts[2][:-1]
                srcPort = source.split(".")[-1]
                destPort = dest.split(".")[-1]
                if "10.30.22.101" in source and (destPort == "443" or destPort == "80"):
                    print source, srcPort, dest, destPort
                    ips[dest] = ips.get(dest, 0) + 1
                isTCP = False
            if "TCP" in line:
                isTCP = True



    sorted_ips = sorted(ips.items(), key= operator.itemgetter(1))

    sorted_ips.reverse()
    
    print sorted_ips



def part2():
    isUDP = False
    with open('trace.txt', 'r') as f:
        for line in f:
            if isUDP:
                parts = parseTCP(line)
                source, dest = parts[0], parts[2][:-1]
                srcPort = source.split(".")[-1]
                destPort = dest.split(".")[-1]
                if ":
                    print source, dest, srcPort, destPort
                    
                isUDP = False
            if "proto UDP" in line:
                isUDP = True



def part2b():
    udp = 0
    tcp = 0
    icmp = 0
    other = 0
    total = 0
    with open('trace.txt', 'r') as f:
        for line in f:
            total += 1
            if "UDP" in line:
                udp += 1
            elif "TCP" in line:
                tcp += 1
            elif "ICMP" in line:
                icmp += 1
            else:
                other += 1
        print "TCP:%d UDP:%d ICMP:%d OTHER:%d TOTAL:%d" %(tcp, udp, icmp, other, total)
#part2()

#part2b()
part2()


