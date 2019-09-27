(define (problem level9)
(:domain sokoban)
(:objects cell0_0 cell1_0 cell2_0 cell3_0 cell4_0 cell5_0 cell6_0 
cell0_1 cell1_1 cell2_1 cell3_1 cell4_1 cell5_1 cell6_1 
cell0_2 cell1_2 cell2_2 cell3_2 cell4_2 cell5_2 cell6_2 
cell0_3 cell1_3 cell2_3 cell3_3 cell4_3 cell5_3 cell6_3 
cell0_4 cell1_4 cell2_4 cell3_4 cell4_4 cell5_4 cell6_4 
cell0_5 cell1_5 cell2_5 cell3_5 cell4_5 cell5_5 cell6_5 
cell0_6 cell1_6 cell2_6 cell3_6 cell4_6 cell5_6 cell6_6 
cell0_7 cell1_7 cell2_7 cell3_7 cell4_7 cell5_7 cell6_7 
)
(:init (wall cell0_0) 
(wall cell1_0) 
(wall cell2_0) 
(wall cell3_0) 
(wall cell4_0) 
(wall cell5_0) 
(wall cell6_0) 
(wall cell0_1) 
(floor cell1_1) 
(floor cell2_1) 
(floor cell3_1) 
(floor cell4_1) 
(floor cell5_1) 
(wall cell6_1) 
(wall cell0_2) 
(floor cell1_2) 
(floor cell2_2) 
(floor cell3_2) (ball cell3_2) 
(floor cell4_2) 
(floor cell5_2) 
(wall cell6_2) 
(wall cell0_3) 
(floor cell1_3) 
(floor cell2_3) (ball cell2_3) 
(floor cell3_3) 
(floor cell4_3) (ball cell4_3) 
(floor cell5_3) 
(wall cell6_3) 
(wall cell0_4) 
(floor cell1_4) 
(floor cell2_4) 
(floor cell3_4) (ball cell3_4) 
(floor cell4_4) 
(floor cell5_4) 
(wall cell6_4) 
(wall cell0_5) 
(floor cell1_5) 
(floor cell2_5) (ball cell2_5) 
(floor cell3_5) 
(floor cell4_5) (ball cell4_5) 
(floor cell5_5) 
(wall cell6_5) 
(wall cell0_6) 
(floor cell1_6) 
(floor cell2_6) 
(floor cell3_6) (player cell3_6) 
(floor cell4_6) 
(floor cell5_6) 
(wall cell6_6) 
(wall cell0_7) 
(wall cell1_7) 
(wall cell2_7) 
(wall cell3_7) 
(wall cell4_7) 
(wall cell5_7) 
(wall cell6_7) 
(north cell0_0 cell0_1)
(north cell1_0 cell1_1)
(north cell2_0 cell2_1)
(north cell3_0 cell3_1)
(north cell4_0 cell4_1)
(north cell5_0 cell5_1)
(north cell6_0 cell6_1)
(north cell0_1 cell0_2)
(north cell1_1 cell1_2)
(north cell2_1 cell2_2)
(north cell3_1 cell3_2)
(north cell4_1 cell4_2)
(north cell5_1 cell5_2)
(north cell6_1 cell6_2)
(north cell0_2 cell0_3)
(north cell1_2 cell1_3)
(north cell2_2 cell2_3)
(north cell3_2 cell3_3)
(north cell4_2 cell4_3)
(north cell5_2 cell5_3)
(north cell6_2 cell6_3)
(north cell0_3 cell0_4)
(north cell1_3 cell1_4)
(north cell2_3 cell2_4)
(north cell3_3 cell3_4)
(north cell4_3 cell4_4)
(north cell5_3 cell5_4)
(north cell6_3 cell6_4)
(north cell0_4 cell0_5)
(north cell1_4 cell1_5)
(north cell2_4 cell2_5)
(north cell3_4 cell3_5)
(north cell4_4 cell4_5)
(north cell5_4 cell5_5)
(north cell6_4 cell6_5)
(north cell0_5 cell0_6)
(north cell1_5 cell1_6)
(north cell2_5 cell2_6)
(north cell3_5 cell3_6)
(north cell4_5 cell4_6)
(north cell5_5 cell5_6)
(north cell6_5 cell6_6)
(north cell0_6 cell0_7)
(north cell1_6 cell1_7)
(north cell2_6 cell2_7)
(north cell3_6 cell3_7)
(north cell4_6 cell4_7)
(north cell5_6 cell5_7)
(north cell6_6 cell6_7)
(west cell0_0 cell1_0)
(west cell1_0 cell2_0)
(west cell2_0 cell3_0)
(west cell3_0 cell4_0)
(west cell4_0 cell5_0)
(west cell5_0 cell6_0)
(west cell0_1 cell1_1)
(west cell1_1 cell2_1)
(west cell2_1 cell3_1)
(west cell3_1 cell4_1)
(west cell4_1 cell5_1)
(west cell5_1 cell6_1)
(west cell0_2 cell1_2)
(west cell1_2 cell2_2)
(west cell2_2 cell3_2)
(west cell3_2 cell4_2)
(west cell4_2 cell5_2)
(west cell5_2 cell6_2)
(west cell0_3 cell1_3)
(west cell1_3 cell2_3)
(west cell2_3 cell3_3)
(west cell3_3 cell4_3)
(west cell4_3 cell5_3)
(west cell5_3 cell6_3)
(west cell0_4 cell1_4)
(west cell1_4 cell2_4)
(west cell2_4 cell3_4)
(west cell3_4 cell4_4)
(west cell4_4 cell5_4)
(west cell5_4 cell6_4)
(west cell0_5 cell1_5)
(west cell1_5 cell2_5)
(west cell2_5 cell3_5)
(west cell3_5 cell4_5)
(west cell4_5 cell5_5)
(west cell5_5 cell6_5)
(west cell0_6 cell1_6)
(west cell1_6 cell2_6)
(west cell2_6 cell3_6)
(west cell3_6 cell4_6)
(west cell4_6 cell5_6)
(west cell5_6 cell6_6)
(west cell0_7 cell1_7)
(west cell1_7 cell2_7)
(west cell2_7 cell3_7)
(west cell3_7 cell4_7)
(west cell4_7 cell5_7)
(west cell5_7 cell6_7)
)
(:goal (and (ball cell2_2 )
(ball cell4_2 )
(ball cell3_3 )
(ball cell2_4 )
(ball cell4_4 )
(ball cell3_5 )
)))