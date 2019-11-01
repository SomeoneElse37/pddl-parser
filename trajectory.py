from PDDL import PDDL_Parser
import pprint

class trajectory:
    def parseObjects(self, objTokens):
        self.types2objs = {}    # Map of types -> objects; useful when you need to know what objects have a specified type
        self.objs2types = {}    # Map of objects -> types; useful when you want to know what the type of a specific object is
        objs = []
        isType = False
        for token in objTokens[1:]: # Throw out objTokens[0], which will be the string ':objects'
            if isType:
                if token not in self.types2objs:
                    self.types2objs[token] = []
                self.types2objs[token].extend(objs)
                for obj in objs:
                    self.objs2types[obj] = token
                objs = []
                isType = False
            elif token == '-':
                isType = True
            else:
                objs.append(token)

    # Parses the :init and :state blocks in the trajectory file, and also makes a dictionary of all the predicates that appear in the states, along with the types of their peremeters
    def parseStates(self, tokens):
        self.states = []
        self.predicates = {}    #TODO implement type inheritance
        for block in tokens:
            if block[0] == ':state' or block[0] == ':init':
                self.states.append(block[1:])
                for pred in block[1:]:
                    pName = pred[0]
                    pTypes = []
                    for arg in pred[1:]:
                        pTypes.append(self.objs2types[arg])
                    if pName in self.predicates:
                        if self.predicates[pName] != pTypes:
                            raise TypeError('Predicate {} believed to have parameter types {}; inconsistent with observed parameters {}'.format(pName, self.predicates[pName], pTypes))
                    else:
                        self.predicates[pName] = pTypes

    def parseActions(self, tokens):
        self.actions = {}
        for block in tokens:
            if block[0] == ':action':
                act_in = block[1]
                # print('Parsing action {}'.format(act_in))
                parTypes = []
                for param in act_in[1:]:
                    parTypes.append(self.objs2types[param])
                duplicate = False
                for act in self.actions.values():
                    # print('Comparing current action name {} to previous action name {}'.format(act_in[0], act.name))
                    if act.name == act_in[0]:
                        # print ('Found action with same name: {}'.format(act.name))
                        duplicate = True
                        if act.parameterTypes != parTypes:
                            raise TypeError('Action {} found using parameters {}; inconsistent with earlier {}. Are you using type inheritance?'.format(act_in[0], parTypes, act.parameterTypes))
                if not duplicate:
                    newAct = actionCandidate(act_in[0], parTypes, self)
                    self.actions[newAct.name] = newAct

    def refineActions(self, tokens):
        assignments = [block[1] for block in tokens if block[0] == ':action']
        # pprint.pprint(assignments)
        for i, agmt in enumerate(assignments):
            act = self.actions[agmt[0]]
            assignment = agmt[1:]
            act.prunePrecons(self.states[i], assignment)
            act.updateEffects(self.states[i], assignment, self.states[i + 1])


    def __init__(self, filename):
        self.parser = PDDL_Parser()
        self.tokens = self.parser.scan_tokens(filename)
        pprint.pprint(self.tokens)
        print('=== Objects ===')
        self.parseObjects(self.tokens[1])
        pprint.pprint(self.types2objs)
        print('=== States ===')
        self.parseStates(self.tokens)
        pprint.pprint(self.states)
        print('=== Predicates ===')
        pprint.pprint(self.predicates)
        print('=== Actions ===')
        self.parseActions(self.tokens)
        # print(self.tokens[3])
        # p, n = self.actions[0].assignPrecons(self.tokens[3][1][1:])
        # print('Grounded Positive preconditions')
        # print(p)
        # print('Grounded Negative preconditions')
        # print(n)
        # print('Before State')
        # print(self.states[0])
        # self.actions[0].prunePrecons(self.states[0], self.tokens[3][1][1:])
        # print(self.actions[0])
        self.refineActions(self.tokens)
        pprint.pprint(self.actions)

# Given a list of lists, returns every possible result of taking one element from each sublist.
# Eg: explode([[1, 2], [3, 4]]) yields [1, 3], [1, 4], [2, 3], [2, 4]
def explode(params):
    # print('Input: {}'.format(params))
    if len(params) == 1:
        for elem in params[0]:
            # print('Base case: Yielding {}'.format([elem]))
            yield [elem]
    else:
        for elem in params[0]:
            # print('Recurring on {}'.format(params[1:]))
            for things in explode(params[1:]):
                # print('Recursion yielded {}'.format(things))
                toYield = [elem]
                toYield.extend(things)
                # print('From recursive branch: Yielding {}'.format(toYield))
                yield toYield

class actionCandidate:
    def __init__(self, name, parTypes, trajectory):
        self.name = name
        self.parameterTypes = parTypes
        self.parNames = []
        self.types2pars = {}
        for pType in parTypes:
            if pType not in self.types2pars:
                self.types2pars[pType] = []
            parName = '{}{}'.format(pType, len(self.types2pars[pType]) + 1)
            self.types2pars[pType].append(parName)
            self.parNames.append(parName)
        self.positivePreconditions = []
        self.negativePreconditions = []
        for predName, predTypes in trajectory.predicates.items():
            toExplode = [self.types2pars[predType] for predType in predTypes]
            exploded = explode(toExplode)
            for ordering in exploded:
                precon = [predName]
                precon.extend(ordering)
                self.positivePreconditions.append(precon)
                self.negativePreconditions.append(precon)
        self.positiveEffects = []
        self.negativeEffects = []
        # print(self)

    def assignPrecons(self, assignment):
        assignMap = dict(zip(self.parNames, assignment))
        # print(assignMap)
        pos_out = []
        neg_out = []
        for prec in self.positivePreconditions:
            grounded = [prec[0]]
            grounded.extend([assignMap[p] for p in prec[1:]])
            pos_out.append(grounded)
        for prec in self.negativePreconditions:
            grounded = [prec[0]]
            grounded.extend([assignMap[p] for p in prec[1:]])
            neg_out.append(grounded)
        return pos_out, neg_out

    def prunePrecons(self, before, assignment):
        pos, neg = self.assignPrecons(assignment)
        new_pos = []
        new_neg = []
        # print('Assignment to {}: {}'.format(self.name, assignment))
        # print('Negative preconditions: {}'.format(neg))
        # print('Before state: {}'.format(before))
        for grounded, pred in zip(pos, self.positivePreconditions):
            if grounded in before:      # If the predicate is in the before state, it could be a positive precondition
                new_pos.append(pred)    # so keep it; otherwise, don't
        for grounded, pred in zip(neg, self.negativePreconditions):
            if grounded not in before:  # If the predicate wasn't in the before state, it could be a negative precondition
                new_neg.append(pred)    # so keep it
            #     print('Keeping {}'.format(grounded))
            # else:
            #     print('Dropping {}'.format(grounded))
        self.positivePreconditions = new_pos
        self.negativePreconditions = new_neg
        # print('New negative preconditions: {}\n'.format(new_neg))

    def updateEffects(self, before, assignment, after):
        # Compute differences between before and after
        pos = [pred for pred in after if pred not in before]
        neg = [pred for pred in before if pred not in after]
        # print('Updating effects of {} {}'.format(self.name, assignment))
        # print('Added predicates: {}'.format(pos))
        # print('Removed predicates: {}'.format(neg))
        # Check that the parameters of the predicates in the difference are a subset of the objects in assignment
        for pred in pos + neg:
            for param in pred[1:]:
                if param not in assignment:
                    raise ValueError('Action {} seems to be affecting predicate {}, with parameters outside its assignment, {}! Are you using conditional effects or something?'.format(
                        self.name, pred, assignment))
        # Map predicate parameters to parNames
        assignMap = dict(zip(assignment, self.parNames))
        new_pos = []
        new_neg = []
        # print('Assignment map: {}'.format(assignMap))
        for pred in pos:
            new_pred = [pred[0]]
            new_pred.extend([assignMap[param] for param in pred[1:]])
            new_pos.append(new_pred)
        for pred in neg:
            new_pred = [pred[0]]
            new_pred.extend([assignMap[param] for param in pred[1:]])
            new_neg.append(new_pred)
        # Check that the result matches the effects from the last run
        new_pos.sort()
        new_neg.sort()
        # print('Sorted positive effects: {}'.format(new_pos))
        # print('Sorted negative effects: {}'.format(new_neg))
        if len(self.positiveEffects) == 0:
            self.positiveEffects = new_pos
        elif new_pos != self.positiveEffects:
            raise ValurError('Positive effects of action {} seem inconsistent! Are you using conditional effects?\nObserved: {}\nNew: {}'.format(self.name, self.positiveEffects, new_pos))
        if len(self.negativeEffects) == 0:
            self.negativeEffects = new_neg
        elif new_neg != self.negativeEffects:
            raise ValurError('Negative effects of action {} seem inconsistent! Are you using conditional effects?\nObserved: {}\nNew: {}'.format(self.name, self.negativeEffects, new_neg))
        # print()

    def __str__(self):
        return '''Action Candidate Name: {}
Parameters: {}
Positive preconditions: {}
Negative preconditions: {}
Positive effects: {}
Negative effects: {}
'''.format(self.name, self.types2pars, self.positivePreconditions, self.negativePreconditions, self.positiveEffects, self.negativeEffects)

    __repr__ = __str__



# Main
if __name__ == '__main__':
    import sys
    filename = sys.argv[1]
    traj = trajectory(filename)



