#!/usr/bin/env python

from sys import argv

level = []

lookup = {'  ': ['floor'],
        '[]': ['wall'],
        '()': ['floor', 'ball'],
        ':)': ['floor', 'player'],
        '//': ['floor', 'goal'],
        '{}': ['floor', 'goal', 'ball'],
        '%)': ['floor, goal, player']}

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

with open(argv[2], 'w') as fout:
    probname = argv[2].split('.')[0]
    fout.write('(define (problem {})\n'.format(probname))
    fout.write('(:domain sokoban)\n')
    fout.write('(:objects ')
    for y in range(len(level)):
        for x in range(len(level[y])):
            fout.write('cell{}_{} '.format(x, y))
        fout.write('\n')
    fout.write(')\n(:init ')
    for y in range(len(level)):
        for x in range(len(level[y])):
            for pred in level[y][x]:
                if pred == 'goal':  # Goal cells are treated differently
                    goals.append('cell{}_{} '.format(x, y))
                else:
                    fout.write('({} cell{}_{}) '.format(pred, x, y))
            fout.write('\n')
    for y in range(len(level) - 1):
        for x in range(len(level[y])):
            fout.write('(north cell{}_{} cell{}_{})\n'.format(x, y, x, y+1))
    for y in range(len(level)):
        for x in range(len(level[y]) - 1):
            fout.write('(west cell{}_{} cell{}_{})\n'.format(x, y, x+1, y))
    fout.write(')\n(:goal (and ')
    for cell in goals:
        fout.write('(ball {})\n'.format(cell))
    fout.write(')))')






