
# Okay... My goal here is to take the information available after execution of trajectory2, and generate a set of invariants.
# Rules about what predicates can and cannot coexist on what kinds of objects.
# As an example invariant, consider the "at-goal" and "at-nongoal" predicates in soko3.
# Every stone has exactly one of those predicates at any given time. Always one or the other; never both or neither. That's an invariant.
# And it's an invariant because that condition ("exactly one") is true in the initial state ov every soko3 level, and none of the soko3 actions can make it false if it wasn't true to begin with.
# Move doesn't change the predicates of any stone; push-to-goal adds at-goal and removes at-nongoal; and push-to-nongoal does the reverse.
# Another example would be the in-dir predicates in soko2, which cannot be added or removed by any action.

# So, I'm thinking I'll start by analyzing the action effects. I'll look for patterns like this:
# P and Q are always added together
# P and Q are always removed together
# P and Q are never both added at once
# P and Q are never both removed at once
# P is only added when Q is removed     ('only' meaning that there are no actions that add P without also removing Q, but there may be actions that remove Q without adding P)
# P is always added when Q is removed
# P is only removed when Q is added
# Etc
# Which I can condense into this:
# P is (only | always) (added | removed) when Q is (added | removed)
# So I could express the at-goal/at-nongoal invariant like this:
#       at-goal    is only   added   when at-nongoal is removed
#   AND at-goal    is always added   when at-nongoal is removed
#   AND at-nongoal is only   added   when at-goal    is removed
#   AND at-nongoal is always added   when at-goal    is removed
#   AND at-goal    is only   removed when at-nongoal is added
#   AND at-goal    is always removed when at-nongoal is added
#   AND at-nongoal is only   removed when at-goal    is added
#   AND at-nongoal is always removed when at-goal    is added
# There's some redundancy there, right?
# If P is always added when Q is removed, then that means that the only actions that remove Q are the ones that also add P.
# [P is always added when Q is removed] <==> [Q is only removed when P is added]
# So maybe I should find a way to give those two contrapositives the same representation in the data structures? Don't know how, though.
# Factoring that into the equality operator should be simple enough, though.
# Also, maybe I should consider invariants on a variable number of predicates? That'd cover the never-added, never-removed constants, and more complex things like "only one or two of these three",
#   but permitting consideration of arbitrary-length rules sounds like it'd get computationally intractable super fast.
# I'll deal with that mess later on, if I determine I need to.
# In the meantime, I'll separately consider constants and 2-predicate-one-object rules.

# Ooh, what about predicates that are only removed and never added? Like the pellets in Pacman.
# Maybe I'll just ignore length-1 rules entirely for now.

# And when should I look at the preconditions of the actions?
# This'd allow statements like "P is only added if Q is present"
# and "Q is never removed if P is present"
# their combination implying that objects with P and Q are a subset of those with only Q, and none can be created with only P
# But the whole purpose of this exercise is to give trajectory2 more accurate preconditions 
# (specifically to help it make up its mine on this like "Should the precondition for this action be is-goal or NOT is-nongoal?")
# so let's ignore this for now, too.

# Hmm...is-goal and is-nongoal are both constants. Maybe I should put some code into identifying those.

# Regardless, th next step is to combine the weak rules formatted above into stronger rules.
# How to represent these?
# Maybe with three booleans, indicating whether or not a given object can have zero, one, or two of the given predicates at the same time?
# So goal/nongoal would be [0 1 0], meaning that there can only ever be one of those predicates on an object at a time after it's been touched by an action; never none or both.
# And two predicates that are always added and removed together would be [1 0 1]
# What are all eight possibilities?
# [0 0 0] is flat-out impossible
# [1 0 0] means neither predicate ever shows up, so they may as well not even exist
# [0 1 0] means they're mutually exclusive and exhaustive, as previously discussed
# [1 1 0] means an object can have zero or one predicate: One or the other, or neother of them, but not both at one. "Mutually exclusive, but not exhaustive".
#   Recognizing this one would require elementary rules for "P is never added if Q present to begin with and not simultaneously being removed"
#   which I don't have plans for at the moment
# [0 0 1] means both always exist, and are never removed
# [1 0 1] means they're always added and removed together, as mentioned above
# [0 1 1] means one or two always exist, but neither can be removed if the other is already present
# [1 1 1] mwans each can exist with or without the other. Maybe there's restrictions on the order in which they can be added and removed, but they're pretty much independent.
# So... of those eight options, four are useless, and two of the rest require information that I'm currently not giving myself access to.
# Nonetheless, I think I'll stick with this representation until I think of something better.

# So... the next step would be to check the initial state, and see if conditions present there are maintained by the refined rules described above.
# Or, rather, if the refined rules described above maintain conditions that happen to be present in the initial state.
# This'd be real simple; for each "mutually exclusive and exhaustive" condition, check every object it could apply to in the initial state,
#   and if each object has exactly one of the associated predicates in the initial state, mark the rule as verified. A proper Invariant.
# And ditto for the "both or neither" rules.
# And for the "zero or one" and "one or two" rules. It shouldn't be hard to write code that'll work for all eight options.

# Then, once I've got the invariants sorted out, go back to trajectory2 (or, more likeky, go forward to trajectory3, which'll be a new trajectory script designed to take this info into account)
# and find a way for it to, well, account for this info.
# Look at the list of "I couldn't decide if some action failed because of this or that", look up 'this' and 'that' in the invariants,
# and if 'this' and 'that' turn out to be equivalent, then include both as preconditions.
# I'll include both, and not pick one at random, because that might give more information to code I may write in the future.
# And picking one arbitrarily seems wrong, somehow.

# I think that's about as far as I can get with this for now. I'll imlpement all that, then run it a few times and see what comes out.
# That'll help inform where I need to make improvements.

def flattenEffects(act):
    for pos in act.positiveEffects:
        yield (pos, True)
    for neg in act.negativeEffects:
        yield (neg, False)

class invariants:
    def __init__(self, traj):
        print ('=== Candidate Primitive Rules ===')
        self.candidatePRs = {}
        self.PRs = set()
        self.mutablePredicates = set()
        for act in traj.actions.values():
            self.candidatePRs[act.name] = set()
            print('Action: {}'.format(act.name))
            for p, pAdds in flattenEffects(act):
                self.mutablePredicates.add(p[0])
                for q, qAdds in flattenEffects(act):
                    if p != q:
                        # At this point, p and q are two different effects of the same action.
                        # Should be, anyway.
                        # print(' {} {} and {} {}'.format(pAdds, p, qAdds, q))
                        for i, arg in enumerate(p[1:]):
                            try:
                                j = q.index(arg, 1) - 1
                                print(' {} {}[{}] and {} {}[{}] {}'.format(pAdds, p, i, qAdds, q, j, arg))
                                # Aight, here we're iterating through each pair of effects that share an argument
                                # So now we... what, write them down and then cross off the ones that aren't consistent across all the actions?
                                pr = primitiveRule(p[0], i, pAdds, q[0], j, qAdds)
                                self.candidatePRs[act.name].add(pr)
                                self.PRs.add(pr)
                            except ValueError:
                                continue
        for actL, rulesL in self.candidatePRs.items():
            for actR, rulesR in self.candidatePRs.items():
                if actL != actR:
                    # Here I'm iterating through each non-repeating ordered pair of actions, with the previously-computed rules of each available
                    for ruleL in rulesL:
                        if ruleL in rulesR:
                            # Both actions have this same rule, so it's still a candidate for that 'always' classification
                            continue
                        else:
                            # If any rules in rulesR match the 'q' part of ruleL (and we already know none of these also match the 'p' part), ruleL is not always true
                            ruleBroken = False
                            for ruleR in rulesR:
                                if ruleL.qname == ruleR.qname and ruleL.qarg == ruleR.qarg and ruleL.qadded == ruleR.qadded:
                                    ruleBroken = True
                                    break
                            if ruleBroken:
                                self.PRs.discard(ruleL)
        # Now, the things in self.PRs should only be the ones that are true for all actions
        print('=== Primitive Rules ===')
        for rule in self.PRs:
            print()
            print(rule)
        # Now... I think I want to tackle constants next
        print('=== Constants ===')
        self.constants = set(traj.predicates.keys()).difference(self.mutablePredicates)
        print(self.constants)

class primitiveRule:
    # Encodes statements like this:
    # P is (only | always) (added | removed) when Q is (added | removed)
    # Actually, since this is true:
    # [P is always added when Q is removed] <==> [Q is only removed when P is added]
    # I can drop the (only | always) bit, and just use 'always' for everything, since an 'only' can be turned into an 'always' by swapping the order of the predicates.
    # And I also need to specify what object the predicates are being added to or removed from.

    def __init__(self, pname, parg, padded, qname, qarg, qadded):
        self.pname = pname
        self.parg = parg
        self.padded = padded
        self.qname = qname
        self.qarg = qarg
        self.qadded = qadded

    def __str__(self):
        pverb = 'added to' if self.padded else 'removed from'
        qverb = 'added to' if self.qadded else 'removed from'
        return 'Predicate {} is always {} its {}th argument when {} is {} its {}th.'.format(self.pname, pverb, self.parg, self.qname, qverb, self.qarg)

    def __eq__(self, other):
        return (self.pname == other.pname
                and self.parg == other.parg
                and self.padded == other.padded
                and self.qname == other.qname
                and self.qarg == other.qarg
                and self.qadded == other.qadded)
    def __hash__(self):
        return hash((self.pname, self.parg, self.padded, self.qname, self.qarg, self.qadded))

# Main
if __name__ == '__main__':
    import sys
    from trajectory import trajectory
    filename = sys.argv[1]
    if len(sys.argv) > 3:
        traj = trajectory(filename, sys.argv[3])
    else:
        traj = trajectory(filename)
    invariants(traj)


