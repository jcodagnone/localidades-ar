
import sys

i = 0
j = 0;
v = [[],[],[],[]]
for line in sys.stdin.readlines():
        line = line.replace('\n', '')
        if line == "":
                i = 0
                j = j +1
        elif line == "":
                i = 0
                while i < len(v[0]):
                        j = 0;
                        while j < len(v):
                                sys.stdout.write("%s\t" % v[j][i])
                                j = j + 1
                        i = i + 1
                        sys.stdout.write('\n')
                i = 0
                j = 0
                v = [[],[],[],[]]
        else:
                v[j].append(line)
                i = i + 1
