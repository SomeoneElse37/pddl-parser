(define (problem level2)
  (:domain sokoban)
  (:objects cell0_0 cell1_0
            cell0_1 cell1_1
            cell0_2 cell1_2
            cell0_3 cell1_3)
  (:init (floor cell0_0) (player cell0_0)
         (floor cell0_1) (ball cell0_1)
         (floor cell0_2)
         (floor cell0_3)
         (wall cell1_0)
      ;      (floor cell1_0)     ; For debug purposes
         (floor cell1_1)
         (floor cell1_2)
         (floor cell1_3)
         (north cell0_0 cell0_1)
         (north cell0_1 cell0_2)
         (north cell0_2 cell0_3)
         (north cell1_0 cell1_1)
         (north cell1_1 cell1_2)
         (north cell1_2 cell1_3)
         (west cell0_0 cell1_0)
         (west cell0_1 cell1_1)
         (west cell0_2 cell1_2)
         (west cell0_3 cell1_3))
  (:goal (ball cell0_0)))


;^#
;O 
;  
;  




