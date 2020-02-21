from PDDL import PDDL_Parser
import pprint
import trajectory2
import invariants

class trajectory3(trajectory2.trajectoryRevised):


    def __init__(self, filename, domain='reconstructed'):
        super().__init__(filename, domain)  # Run all the code from my previous trajectory scripts
        print('\n=========== Compute Invariants ==============\n')
        self.invariants = invariants.invariants(self)


# Main
if __name__ == '__main__':
    import sys
    filename = sys.argv[1]
    if len(sys.argv) > 3:
        traj = trajectory3(filename, sys.argv[3])
    else:
        traj = trajectory3(filename)
    if len(sys.argv) > 2:
        fout = open(sys.argv[2], 'w')
    else:
        fout = sys.stdout
    fout.write(str(traj))


