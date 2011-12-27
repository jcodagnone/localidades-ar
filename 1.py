#!/usr/bin/env python

rf = file('dbpedia/dbpedia.csv', 'r')
lf = file('codigo-postal/correo.csv', 'r')

def r():
        a = rf.readline().replace('\n', '').strip().replace('"', '').split('\t')
        print len(a)
        if len(a) < 6:
                a.insert(0, '')
        else:
                a[0] = int(a[0])
                a[1] = a[1].strip()
        return a
def l():
        a = lf.readline().replace('\n', '').strip().split('\t')
        a[0] = int(a[0])
        return a

d = r()
i = l()
while True:
        if d[0] == i[0]:
                if d[1] == i[len(i)-1]:
                    print d,i
                    d = r()
                    i = l()
                else:
                    #print d
                    d = r()

        elif d[0] < i[0]:
                #print d
                d = r()
        else:
                #print i
                i = l()
