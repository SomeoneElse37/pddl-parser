#!/usr/bin/env python

from sys import argv

level = []

lookup = {'  ': [],
        '[]': ['wall'],
        '()': ['ball'],
        ':)': ['player'],
        '\/': ['pit'],
        '//': ['goal'],
        '{}': ['goal', 'ball'],
        '%)': ['goal', 'player']}

with open(argv[1], 'r') as fin:
        y = 0
        for line in fin:
            level.append([])
            for x in range(0, len(line), 2):
                cell = line[x:x+2]
                if cell != '\n':
                    level[y].append(lookup[cell])
            y += 1

goals = []

def addVec(u, v):
    return [a + b for (a, b) in zip(u, v)]

directions = {'w': ( 0,-1), #TODO Encode this information into the input file somehow
        'a': (-1, 0),
        's': ( 0, 1),
        'd': ( 1, 0)#,
        # 'q': (-1,-1),
        # 'e': ( 1,-1),
        # 'z': (-1, 1),
        # 'c': ( 1, 1)
        }

with open(argv[2], 'w') as fout:
    probname = argv[2].split('.')[0]
    fout.write('(define (problem {})\n'.format(probname))
    fout.write('(:domain soko2)\n')
    fout.write('(:objects ')
    for y in range(len(level)):
        for x in range(len(level[y])):
            fout.write('cell{}_{} '.format(x, y))
        fout.write('\n')
    fout.write('- cell\n')
    for d in directions.keys():
        fout.write(d + ' ')
    fout.write(' - dir)\n(:init ')
    for y in range(len(level)):
        for x in range(len(level[y])):
            for pred in level[y][x]:
                if pred == 'goal':  # Goal cells are treated differently
                    goals.append('cell{}_{} '.format(x, y))
                else:
                    fout.write('({} cell{}_{}) '.format(pred, x, y))
        fout.write('\n')
    for d, vec in directions.items():
        for y in range(len(level)):
            printedLine = False
            for x in range(len(level[y])):
                a, b = addVec((x, y), vec)
                if 0 <= a < len(level[y]) and 0 <= b < len(level):
                    fout.write('(in-dir {} cell{}_{} cell{}_{}) '.format(d, x, y, a, b))
                    printedLine = True
            if printedLine:
                fout.write('\n')
    fout.write(')\n(:goal (and ')
    for cell in goals:
        fout.write('(ball {})\n'.format(cell))
    fout.write(')))')






