(define (problem level1)
  (:domain sokoban)
  (:objects cell0_0
            cell0_1
            cell0_2)
  (:init (floor cell0_0)
         (floor cell0_1) (ball cell0_1)
         (floor cell0_2) (player cell0_2)
         (north cell0_0 cell0_1)
         (north cell0_1 cell0_2))
  (:goal (ball cell0_0)))






