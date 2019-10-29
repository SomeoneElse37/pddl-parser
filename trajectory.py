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
        self.predicates = {}
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

    def parseActions

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
    def __init__(self, name, parTypes, preds):
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
        for predName, predTypes in preds.items():
            toExplode = [self.types2pars[predType] for predType in predTypes]
            exploded = explode(toExplode)
            for ordering in exploded:
                precon = [predName]
                precon.extend(ordering)
                self.positivePreconditions.append(precon)
                self.negativePreconditions.append(precon)
        print(self)

    def __str__(self):
        return '''Action Candidate Name: {}
Parameters: {}
Positive preconditions: {}
Negative preconditions: {}
'''.format(self.name, self.types2pars, self.positivePreconditions, self.nagativePreconditions)



# Main
if __name__ == '__main__':
    import sys
    filename = sys.argv[1]
    traj = trajectory(filename)



