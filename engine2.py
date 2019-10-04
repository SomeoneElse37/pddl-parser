#!/usr/bin/env python

from PDDL import PDDL_Parser
from planner import Planner
from action import Action

import datetime
# from pynput import keyboard

# def on_press(key):
#     try:
#         print('alphanumeric key {0} pressed'.format(
#             key.char))
#     except AttributeError:
#         print('special key {0} pressed'.format(
#             key))

# def on_release(key):
#     print('{0} released'.format(
#         key))
#     if key == keyboard.Key.esc:
#         # Stop listener
#         return False

# # Collect events until released
# # with keyboard.Listener(
# #         on_press=on_press,
# #         on_release=on_release) as listener:
# #     listener.join()

# # ...or, in a non-blocking fashion:
# listener = keyboard.Listener(
#     on_press=on_press,
#     on_release=on_release)
# listener.start()
# listener.join

class Engine:

    def __init__(self, domain, problem, logfile='/dev/null'):
        # Parser
        self.parser = PDDL_Parser()
        self.parser.parse_domain(domain)
        self.parser.parse_problem(problem)
        # Parsed data
        self.state = self.parser.state
        self.goal_pos = self.parser.positive_goals
        self.goal_not = self.parser.negative_goals

        self.history = []
        self.movelog = []

        self.logfile = logfile

        self.planner = Planner()
        # Do nothing
        if self.planner.applicable(self.state, self.goal_pos, self.goal_not):
            print('Puzzle is already solved! Double-check your problem file!')

    def parseCellName(self, cellName):
        x, y = cellName[4:].split('_')
        # print(cellName)
        # print(out)
        return int(x), int(y)

    def findPlayer(self):
        for pred in self.state:
            if pred[0] == 'player':
                return self.parseCellName(pred[1])
        raise ValueError('Player not found!')

    def formatPos(self, coords):
        return 'cell{}_{}'.format(coords[0], coords[1])

    def groundAction(self, act, assignment):
        variables = []
        for v, _ in act.parameters:
            variables.append(v)
        pps = act.replace(act.positive_preconditions, variables, assignment)
        nps = act.replace(act.negative_preconditions, variables, assignment)
        aes = act.replace(act.add_effects, variables, assignment)
        des = act.replace(act.del_effects, variables, assignment)
        return Action(act.name, assignment, pps, nps, aes, des)

    def addVec(self, *vecs):
        x = 0
        y = 0
        for u, v in vecs:
            x += u
            y += v
        return (x, y)

    # act must already be grounded (e.g. by self.groundAction)
    def tryAction(self, act, log):
        # print(self.state)
        # print(act.positive_preconditions)
        # print(act.negative_preconditions)
        # print(self.planner.applicable(self.state, act.positive_preconditions, act.negative_preconditions))
        if self.planner.applicable(self.state, act.positive_preconditions, act.negative_preconditions):
            # log.write(str(self.state) + '\n')
            # log.write(str(act))
            act_str = '(:action ({}))'.format(' '.join([act.name, *act.parameters]))
            self.history.append(self.state)
            self.state = self.planner.apply(self.state, act.add_effects, act.del_effects)
            # log.write(self.lispState() + '\n\n')
            self.movelog.append('{}\n\n{}\n\n'.format(act_str, self.lispState()))
            return True
        else:
            return False

    def lookupAction(self, actName):
        for act in self.parser.actions:
            if act.name == actName:
                return act
        return None

    # Finds the next cell adjacent to curCell in direction direc
    def findNextCell(self, curCell, direc):
        for cell in self.parser.objects['cell']:
            if self.planner.applicable(self.state, [['in-dir', direc, curCell, cell]], []):
                return cell
        return None

    def doMove(self, key, log):
        if key == 'u':
            if len(self.history) >= 1:
                self.state = self.history.pop()
                self.movelog.pop()
            return True
        elif key == 'r':
            self.state = self.parser.state
            # self.history.append(self.state)
            self.history = [self.state]
            self.movelog = []
            return True
        # else:
        #     # log.write('Unparseable input: {}\n\n'.format(key))
        #     return False
        # print(key, delta, actions)
        playerPos = self.findPlayer()
        # print(key, currentCell)
        for act in self.parser.actions:
            currentCell = self.formatPos(playerPos)
            assignment = [key]
            while len(assignment) < len(act.parameters):
                assignment.append(currentCell)
                currentCell = self.findNextCell(currentCell, key)    # Having to do this for every cell parameter in every action is inefficient; maybe improve later?
            gact = self.groundAction(act, assignment)
            # print(gact)
            if self.tryAction(gact, log):
                return True
        return False

        # nextCell = self.formatPos(self.addVec(playerPos, delta))
        # afterCell = self.formatPos(self.addVec(playerPos, delta, delta))
        # # print(playerPos, playerCell, nextCell, afterCell)
        # act = self.lookupAction(actions[0])
        # gact = self.groundAction(act, [playerCell, nextCell])
        # # print(gact)
        # if self.tryAction(gact, log):
        #     return True
        # else:
        #     act = self.lookupAction(actions[1])
        #     gact = self.groundAction(act, [playerCell, nextCell, afterCell])
        #     # print(gact)
        #     if self.tryAction(gact, log):
        #         return True
        # # log.write('Blocked move: {}\n\n'.format(actions))
        # return False

    predIDs = {'wall'   : 1,
            'player'    : 2,
            'ball'      : 4,
            'pit'       : 8,
            'goal'      : 16}

    tiles = {0: '  ',   # Floor
             1: '[]',   # Wall
             2: ':)',   # Player
             4: '()',   # Boulder
             8: '\/',   # Pit
            16: '//',   # Goal
            18: '%)',   # Goal and player
            20: '{}'}   # Goal and boulder

    def render(self):
        w, h = 0, 0
        for cell in self.parser.objects['cell']:
            x, y = self.parseCellName(cell)
            w = max(w, x+1)
            h = max(h, y+1)
        for y in range(h):
            for x in range(w):
                cell = self.formatPos((x, y))
                code = 0
                # print(cell)
                # print(self.state)
                for pred, pid in self.predIDs.items():
                    if self.planner.applicable(self.state, [[pred, cell]], []):
                        code += pid
                if self.planner.applicable(self.goal_pos, [['ball', cell]], []):
                    code += self.predIDs['goal']
                print(self.tiles[code], end='')
                # if self.planner.applicable(self.state, [['wall', cell]], []):
                #     code = -1
                # else:
                #     if self.planner.applicable(self.state, [['floor', cell]], []):
                #         code = 1
                #     if self.planner.applicable(self.state, [['ball', cell]], []):
                #         code += 2
                #     if self.planner.applicable(self.goal_pos, [['ball', cell]], []):
                #         code += 4
                #     if self.planner.applicable(self.state, [['player', cell]], []):
                #         code += 8
            print()

    def lispState(self, word=':state'):
        out = []
        out.append('({}'.format(word))
        for pred in self.state:
            out.append(' (')
            out.append(' '.join(pred))
            out.append(')')
        out.append(')')
        return ''.join(out)

    def gameloop(self):
        with open(self.logfile, 'w') as log:
            # log.write('{}\n\n'.format(datetime.datetime.now()))
            log.write('(trajectory\n\n')
            log.write('(:objects ')
            for t, os in self.parser.objects.items():
                for o in os:
                    log.write('{} -  {} '.format(o, t))
            log.write(')\n\n')
            log.write(self.lispState(':init'))
            log.write('\n\n')
            while True:
                self.render()
                if self.planner.applicable(self.state, self.goal_pos, self.goal_not):
                    print('Winningness!')
                    log.write(''.join(self.movelog))
                    log.write(')')
                    return
                prevTime = time.time()
                key = input('Choose direction ({}ur, followed by Enter): '.format(''.join(self.parser.objects['dir'])))
                # log.write('{}\n\n'.format(time.time() - prevTime))
                self.doMove(key, log)


# ==========================================
# Main
# ==========================================
if __name__ == '__main__':
    import sys, time
    start_time = time.time()
    domain = sys.argv[1]
    problem = sys.argv[2]
    try:
        logfile = sys.argv[3]
    except IndexError:
        logfile = '/dev/null'
    engine = Engine(domain, problem, logfile)
    engine.gameloop()
    print('Time: ' + str(time.time() - start_time) + 's')
    # if plan:
    #     print('plan:')
    #     for act in plan:
    #         print(act)
    # else:
    #     print('No plan was found')



