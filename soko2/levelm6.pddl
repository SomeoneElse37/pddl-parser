(define (problem level8)
(:domain soko2)
(:objects cell0_0 cell1_0 cell2_0 cell3_0 cell4_0 cell5_0 cell6_0 cell7_0 cell8_0 cell9_0 cell10_0 cell11_0 
cell0_1 cell1_1 cell2_1 cell3_1 cell4_1 cell5_1 cell6_1 cell7_1 cell8_1 cell9_1 cell10_1 cell11_1 
cell0_2 cell1_2 cell2_2 cell3_2 cell4_2 cell5_2 cell6_2 cell7_2 cell8_2 cell9_2 cell10_2 cell11_2 
cell0_3 cell1_3 cell2_3 cell3_3 cell4_3 cell5_3 cell6_3 cell7_3 cell8_3 cell9_3 cell10_3 cell11_3 
cell0_4 cell1_4 cell2_4 cell3_4 cell4_4 cell5_4 cell6_4 cell7_4 cell8_4 cell9_4 cell10_4 cell11_4 
cell0_5 cell1_5 cell2_5 cell3_5 cell4_5 cell5_5 cell6_5 cell7_5 cell8_5 cell9_5 cell10_5 cell11_5 
- cell
w a s d  - dir)
(:init (wall cell0_0) (wall cell1_0) (wall cell2_0) (wall cell3_0) (wall cell4_0) (wall cell5_0) (wall cell6_0) (wall cell7_0) (wall cell8_0) (wall cell9_0) (wall cell10_0) (wall cell11_0) 
(wall cell0_1) (wall cell5_1) (wall cell6_1) (wall cell7_1) (wall cell11_1) 
(wall cell0_2) (ball cell2_2) (ball cell3_2) (wall cell9_2) (player cell10_2) (wall cell11_2) 
(wall cell0_3) (ball cell2_3) (wall cell4_3) (wall cell11_3) 
(wall cell0_4) (wall cell4_4) (wall cell5_4) (wall cell6_4) (wall cell7_4) (wall cell8_4) (wall cell9_4) (wall cell10_4) (wall cell11_4) 
(wall cell0_5) (wall cell1_5) (wall cell2_5) (wall cell3_5) (wall cell4_5) (wall cell5_5) (wall cell6_5) (wall cell7_5) (wall cell8_5) (wall cell9_5) (wall cell10_5) (wall cell11_5) 
(in-dir w cell0_1 cell0_0) (in-dir w cell1_1 cell1_0) (in-dir w cell2_1 cell2_0) (in-dir w cell3_1 cell3_0) (in-dir w cell4_1 cell4_0) (in-dir w cell5_1 cell5_0) (in-dir w cell6_1 cell6_0) (in-dir w cell7_1 cell7_0) (in-dir w cell8_1 cell8_0) (in-dir w cell9_1 cell9_0) (in-dir w cell10_1 cell10_0) (in-dir w cell11_1 cell11_0) 
(in-dir w cell0_2 cell0_1) (in-dir w cell1_2 cell1_1) (in-dir w cell2_2 cell2_1) (in-dir w cell3_2 cell3_1) (in-dir w cell4_2 cell4_1) (in-dir w cell5_2 cell5_1) (in-dir w cell6_2 cell6_1) (in-dir w cell7_2 cell7_1) (in-dir w cell8_2 cell8_1) (in-dir w cell9_2 cell9_1) (in-dir w cell10_2 cell10_1) (in-dir w cell11_2 cell11_1) 
(in-dir w cell0_3 cell0_2) (in-dir w cell1_3 cell1_2) (in-dir w cell2_3 cell2_2) (in-dir w cell3_3 cell3_2) (in-dir w cell4_3 cell4_2) (in-dir w cell5_3 cell5_2) (in-dir w cell6_3 cell6_2) (in-dir w cell7_3 cell7_2) (in-dir w cell8_3 cell8_2) (in-dir w cell9_3 cell9_2) (in-dir w cell10_3 cell10_2) (in-dir w cell11_3 cell11_2) 
(in-dir w cell0_4 cell0_3) (in-dir w cell1_4 cell1_3) (in-dir w cell2_4 cell2_3) (in-dir w cell3_4 cell3_3) (in-dir w cell4_4 cell4_3) (in-dir w cell5_4 cell5_3) (in-dir w cell6_4 cell6_3) (in-dir w cell7_4 cell7_3) (in-dir w cell8_4 cell8_3) (in-dir w cell9_4 cell9_3) (in-dir w cell10_4 cell10_3) (in-dir w cell11_4 cell11_3) 
(in-dir w cell0_5 cell0_4) (in-dir w cell1_5 cell1_4) (in-dir w cell2_5 cell2_4) (in-dir w cell3_5 cell3_4) (in-dir w cell4_5 cell4_4) (in-dir w cell5_5 cell5_4) (in-dir w cell6_5 cell6_4) (in-dir w cell7_5 cell7_4) (in-dir w cell8_5 cell8_4) (in-dir w cell9_5 cell9_4) (in-dir w cell10_5 cell10_4) (in-dir w cell11_5 cell11_4) 
(in-dir a cell1_0 cell0_0) (in-dir a cell2_0 cell1_0) (in-dir a cell3_0 cell2_0) (in-dir a cell4_0 cell3_0) (in-dir a cell5_0 cell4_0) (in-dir a cell6_0 cell5_0) (in-dir a cell7_0 cell6_0) (in-dir a cell8_0 cell7_0) (in-dir a cell9_0 cell8_0) (in-dir a cell10_0 cell9_0) (in-dir a cell11_0 cell10_0) 
(in-dir a cell1_1 cell0_1) (in-dir a cell2_1 cell1_1) (in-dir a cell3_1 cell2_1) (in-dir a cell4_1 cell3_1) (in-dir a cell5_1 cell4_1) (in-dir a cell6_1 cell5_1) (in-dir a cell7_1 cell6_1) (in-dir a cell8_1 cell7_1) (in-dir a cell9_1 cell8_1) (in-dir a cell10_1 cell9_1) (in-dir a cell11_1 cell10_1) 
(in-dir a cell1_2 cell0_2) (in-dir a cell2_2 cell1_2) (in-dir a cell3_2 cell2_2) (in-dir a cell4_2 cell3_2) (in-dir a cell5_2 cell4_2) (in-dir a cell6_2 cell5_2) (in-dir a cell7_2 cell6_2) (in-dir a cell8_2 cell7_2) (in-dir a cell9_2 cell8_2) (in-dir a cell10_2 cell9_2) (in-dir a cell11_2 cell10_2) 
(in-dir a cell1_3 cell0_3) (in-dir a cell2_3 cell1_3) (in-dir a cell3_3 cell2_3) (in-dir a cell4_3 cell3_3) (in-dir a cell5_3 cell4_3) (in-dir a cell6_3 cell5_3) (in-dir a cell7_3 cell6_3) (in-dir a cell8_3 cell7_3) (in-dir a cell9_3 cell8_3) (in-dir a cell10_3 cell9_3) (in-dir a cell11_3 cell10_3) 
(in-dir a cell1_4 cell0_4) (in-dir a cell2_4 cell1_4) (in-dir a cell3_4 cell2_4) (in-dir a cell4_4 cell3_4) (in-dir a cell5_4 cell4_4) (in-dir a cell6_4 cell5_4) (in-dir a cell7_4 cell6_4) (in-dir a cell8_4 cell7_4) (in-dir a cell9_4 cell8_4) (in-dir a cell10_4 cell9_4) (in-dir a cell11_4 cell10_4) 
(in-dir a cell1_5 cell0_5) (in-dir a cell2_5 cell1_5) (in-dir a cell3_5 cell2_5) (in-dir a cell4_5 cell3_5) (in-dir a cell5_5 cell4_5) (in-dir a cell6_5 cell5_5) (in-dir a cell7_5 cell6_5) (in-dir a cell8_5 cell7_5) (in-dir a cell9_5 cell8_5) (in-dir a cell10_5 cell9_5) (in-dir a cell11_5 cell10_5) 
(in-dir s cell0_0 cell0_1) (in-dir s cell1_0 cell1_1) (in-dir s cell2_0 cell2_1) (in-dir s cell3_0 cell3_1) (in-dir s cell4_0 cell4_1) (in-dir s cell5_0 cell5_1) (in-dir s cell6_0 cell6_1) (in-dir s cell7_0 cell7_1) (in-dir s cell8_0 cell8_1) (in-dir s cell9_0 cell9_1) (in-dir s cell10_0 cell10_1) (in-dir s cell11_0 cell11_1) 
(in-dir s cell0_1 cell0_2) (in-dir s cell1_1 cell1_2) (in-dir s cell2_1 cell2_2) (in-dir s cell3_1 cell3_2) (in-dir s cell4_1 cell4_2) (in-dir s cell5_1 cell5_2) (in-dir s cell6_1 cell6_2) (in-dir s cell7_1 cell7_2) (in-dir s cell8_1 cell8_2) (in-dir s cell9_1 cell9_2) (in-dir s cell10_1 cell10_2) (in-dir s cell11_1 cell11_2) 
(in-dir s cell0_2 cell0_3) (in-dir s cell1_2 cell1_3) (in-dir s cell2_2 cell2_3) (in-dir s cell3_2 cell3_3) (in-dir s cell4_2 cell4_3) (in-dir s cell5_2 cell5_3) (in-dir s cell6_2 cell6_3) (in-dir s cell7_2 cell7_3) (in-dir s cell8_2 cell8_3) (in-dir s cell9_2 cell9_3) (in-dir s cell10_2 cell10_3) (in-dir s cell11_2 cell11_3) 
(in-dir s cell0_3 cell0_4) (in-dir s cell1_3 cell1_4) (in-dir s cell2_3 cell2_4) (in-dir s cell3_3 cell3_4) (in-dir s cell4_3 cell4_4) (in-dir s cell5_3 cell5_4) (in-dir s cell6_3 cell6_4) (in-dir s cell7_3 cell7_4) (in-dir s cell8_3 cell8_4) (in-dir s cell9_3 cell9_4) (in-dir s cell10_3 cell10_4) (in-dir s cell11_3 cell11_4) 
(in-dir s cell0_4 cell0_5) (in-dir s cell1_4 cell1_5) (in-dir s cell2_4 cell2_5) (in-dir s cell3_4 cell3_5) (in-dir s cell4_4 cell4_5) (in-dir s cell5_4 cell5_5) (in-dir s cell6_4 cell6_5) (in-dir s cell7_4 cell7_5) (in-dir s cell8_4 cell8_5) (in-dir s cell9_4 cell9_5) (in-dir s cell10_4 cell10_5) (in-dir s cell11_4 cell11_5) 
(in-dir d cell0_0 cell1_0) (in-dir d cell1_0 cell2_0) (in-dir d cell2_0 cell3_0) (in-dir d cell3_0 cell4_0) (in-dir d cell4_0 cell5_0) (in-dir d cell5_0 cell6_0) (in-dir d cell6_0 cell7_0) (in-dir d cell7_0 cell8_0) (in-dir d cell8_0 cell9_0) (in-dir d cell9_0 cell10_0) (in-dir d cell10_0 cell11_0) 
(in-dir d cell0_1 cell1_1) (in-dir d cell1_1 cell2_1) (in-dir d cell2_1 cell3_1) (in-dir d cell3_1 cell4_1) (in-dir d cell4_1 cell5_1) (in-dir d cell5_1 cell6_1) (in-dir d cell6_1 cell7_1) (in-dir d cell7_1 cell8_1) (in-dir d cell8_1 cell9_1) (in-dir d cell9_1 cell10_1) (in-dir d cell10_1 cell11_1) 
(in-dir d cell0_2 cell1_2) (in-dir d cell1_2 cell2_2) (in-dir d cell2_2 cell3_2) (in-dir d cell3_2 cell4_2) (in-dir d cell4_2 cell5_2) (in-dir d cell5_2 cell6_2) (in-dir d cell6_2 cell7_2) (in-dir d cell7_2 cell8_2) (in-dir d cell8_2 cell9_2) (in-dir d cell9_2 cell10_2) (in-dir d cell10_2 cell11_2) 
(in-dir d cell0_3 cell1_3) (in-dir d cell1_3 cell2_3) (in-dir d cell2_3 cell3_3) (in-dir d cell3_3 cell4_3) (in-dir d cell4_3 cell5_3) (in-dir d cell5_3 cell6_3) (in-dir d cell6_3 cell7_3) (in-dir d cell7_3 cell8_3) (in-dir d cell8_3 cell9_3) (in-dir d cell9_3 cell10_3) (in-dir d cell10_3 cell11_3) 
(in-dir d cell0_4 cell1_4) (in-dir d cell1_4 cell2_4) (in-dir d cell2_4 cell3_4) (in-dir d cell3_4 cell4_4) (in-dir d cell4_4 cell5_4) (in-dir d cell5_4 cell6_4) (in-dir d cell6_4 cell7_4) (in-dir d cell7_4 cell8_4) (in-dir d cell8_4 cell9_4) (in-dir d cell9_4 cell10_4) (in-dir d cell10_4 cell11_4) 
(in-dir d cell0_5 cell1_5) (in-dir d cell1_5 cell2_5) (in-dir d cell2_5 cell3_5) (in-dir d cell3_5 cell4_5) (in-dir d cell4_5 cell5_5) (in-dir d cell5_5 cell6_5) (in-dir d cell6_5 cell7_5) (in-dir d cell7_5 cell8_5) (in-dir d cell8_5 cell9_5) (in-dir d cell9_5 cell10_5) (in-dir d cell10_5 cell11_5) 
)
(:goal (and (ball cell5_3 )
(ball cell6_3 )
(ball cell7_3 )
)))