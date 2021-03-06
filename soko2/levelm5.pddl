(define (problem level7)
(:domain soko2)
(:objects cell0_0 cell1_0 cell2_0 cell3_0 cell4_0 cell5_0 cell6_0 cell7_0 
cell0_1 cell1_1 cell2_1 cell3_1 cell4_1 cell5_1 cell6_1 cell7_1 
cell0_2 cell1_2 cell2_2 cell3_2 cell4_2 cell5_2 cell6_2 cell7_2 
cell0_3 cell1_3 cell2_3 cell3_3 cell4_3 cell5_3 cell6_3 cell7_3 
cell0_4 cell1_4 cell2_4 cell3_4 cell4_4 cell5_4 cell6_4 cell7_4 
cell0_5 cell1_5 cell2_5 cell3_5 cell4_5 cell5_5 cell6_5 cell7_5 
cell0_6 cell1_6 cell2_6 cell3_6 cell4_6 cell5_6 cell6_6 cell7_6 
- cell
w a s d  - dir)
(:init (wall cell0_0) (wall cell1_0) (wall cell2_0) (wall cell3_0) (wall cell4_0) (wall cell5_0) (wall cell6_0) (wall cell7_0) 
(wall cell0_1) (wall cell1_1) (wall cell7_1) 
(wall cell0_2) (wall cell1_2) (ball cell4_2) (wall cell7_2) 
(wall cell0_3) (wall cell1_3) (ball cell3_3) (player cell4_3) (ball cell5_3) (wall cell7_3) 
(wall cell0_4) (ball cell4_4) (wall cell7_4) 
(wall cell0_5) (wall cell7_5) 
(wall cell0_6) (wall cell1_6) (wall cell2_6) (wall cell3_6) (wall cell4_6) (wall cell5_6) (wall cell6_6) (wall cell7_6) 
(in-dir w cell0_1 cell0_0) (in-dir w cell1_1 cell1_0) (in-dir w cell2_1 cell2_0) (in-dir w cell3_1 cell3_0) (in-dir w cell4_1 cell4_0) (in-dir w cell5_1 cell5_0) (in-dir w cell6_1 cell6_0) (in-dir w cell7_1 cell7_0) 
(in-dir w cell0_2 cell0_1) (in-dir w cell1_2 cell1_1) (in-dir w cell2_2 cell2_1) (in-dir w cell3_2 cell3_1) (in-dir w cell4_2 cell4_1) (in-dir w cell5_2 cell5_1) (in-dir w cell6_2 cell6_1) (in-dir w cell7_2 cell7_1) 
(in-dir w cell0_3 cell0_2) (in-dir w cell1_3 cell1_2) (in-dir w cell2_3 cell2_2) (in-dir w cell3_3 cell3_2) (in-dir w cell4_3 cell4_2) (in-dir w cell5_3 cell5_2) (in-dir w cell6_3 cell6_2) (in-dir w cell7_3 cell7_2) 
(in-dir w cell0_4 cell0_3) (in-dir w cell1_4 cell1_3) (in-dir w cell2_4 cell2_3) (in-dir w cell3_4 cell3_3) (in-dir w cell4_4 cell4_3) (in-dir w cell5_4 cell5_3) (in-dir w cell6_4 cell6_3) (in-dir w cell7_4 cell7_3) 
(in-dir w cell0_5 cell0_4) (in-dir w cell1_5 cell1_4) (in-dir w cell2_5 cell2_4) (in-dir w cell3_5 cell3_4) (in-dir w cell4_5 cell4_4) (in-dir w cell5_5 cell5_4) (in-dir w cell6_5 cell6_4) (in-dir w cell7_5 cell7_4) 
(in-dir w cell0_6 cell0_5) (in-dir w cell1_6 cell1_5) (in-dir w cell2_6 cell2_5) (in-dir w cell3_6 cell3_5) (in-dir w cell4_6 cell4_5) (in-dir w cell5_6 cell5_5) (in-dir w cell6_6 cell6_5) (in-dir w cell7_6 cell7_5) 
(in-dir a cell1_0 cell0_0) (in-dir a cell2_0 cell1_0) (in-dir a cell3_0 cell2_0) (in-dir a cell4_0 cell3_0) (in-dir a cell5_0 cell4_0) (in-dir a cell6_0 cell5_0) (in-dir a cell7_0 cell6_0) 
(in-dir a cell1_1 cell0_1) (in-dir a cell2_1 cell1_1) (in-dir a cell3_1 cell2_1) (in-dir a cell4_1 cell3_1) (in-dir a cell5_1 cell4_1) (in-dir a cell6_1 cell5_1) (in-dir a cell7_1 cell6_1) 
(in-dir a cell1_2 cell0_2) (in-dir a cell2_2 cell1_2) (in-dir a cell3_2 cell2_2) (in-dir a cell4_2 cell3_2) (in-dir a cell5_2 cell4_2) (in-dir a cell6_2 cell5_2) (in-dir a cell7_2 cell6_2) 
(in-dir a cell1_3 cell0_3) (in-dir a cell2_3 cell1_3) (in-dir a cell3_3 cell2_3) (in-dir a cell4_3 cell3_3) (in-dir a cell5_3 cell4_3) (in-dir a cell6_3 cell5_3) (in-dir a cell7_3 cell6_3) 
(in-dir a cell1_4 cell0_4) (in-dir a cell2_4 cell1_4) (in-dir a cell3_4 cell2_4) (in-dir a cell4_4 cell3_4) (in-dir a cell5_4 cell4_4) (in-dir a cell6_4 cell5_4) (in-dir a cell7_4 cell6_4) 
(in-dir a cell1_5 cell0_5) (in-dir a cell2_5 cell1_5) (in-dir a cell3_5 cell2_5) (in-dir a cell4_5 cell3_5) (in-dir a cell5_5 cell4_5) (in-dir a cell6_5 cell5_5) (in-dir a cell7_5 cell6_5) 
(in-dir a cell1_6 cell0_6) (in-dir a cell2_6 cell1_6) (in-dir a cell3_6 cell2_6) (in-dir a cell4_6 cell3_6) (in-dir a cell5_6 cell4_6) (in-dir a cell6_6 cell5_6) (in-dir a cell7_6 cell6_6) 
(in-dir s cell0_0 cell0_1) (in-dir s cell1_0 cell1_1) (in-dir s cell2_0 cell2_1) (in-dir s cell3_0 cell3_1) (in-dir s cell4_0 cell4_1) (in-dir s cell5_0 cell5_1) (in-dir s cell6_0 cell6_1) (in-dir s cell7_0 cell7_1) 
(in-dir s cell0_1 cell0_2) (in-dir s cell1_1 cell1_2) (in-dir s cell2_1 cell2_2) (in-dir s cell3_1 cell3_2) (in-dir s cell4_1 cell4_2) (in-dir s cell5_1 cell5_2) (in-dir s cell6_1 cell6_2) (in-dir s cell7_1 cell7_2) 
(in-dir s cell0_2 cell0_3) (in-dir s cell1_2 cell1_3) (in-dir s cell2_2 cell2_3) (in-dir s cell3_2 cell3_3) (in-dir s cell4_2 cell4_3) (in-dir s cell5_2 cell5_3) (in-dir s cell6_2 cell6_3) (in-dir s cell7_2 cell7_3) 
(in-dir s cell0_3 cell0_4) (in-dir s cell1_3 cell1_4) (in-dir s cell2_3 cell2_4) (in-dir s cell3_3 cell3_4) (in-dir s cell4_3 cell4_4) (in-dir s cell5_3 cell5_4) (in-dir s cell6_3 cell6_4) (in-dir s cell7_3 cell7_4) 
(in-dir s cell0_4 cell0_5) (in-dir s cell1_4 cell1_5) (in-dir s cell2_4 cell2_5) (in-dir s cell3_4 cell3_5) (in-dir s cell4_4 cell4_5) (in-dir s cell5_4 cell5_5) (in-dir s cell6_4 cell6_5) (in-dir s cell7_4 cell7_5) 
(in-dir s cell0_5 cell0_6) (in-dir s cell1_5 cell1_6) (in-dir s cell2_5 cell2_6) (in-dir s cell3_5 cell3_6) (in-dir s cell4_5 cell4_6) (in-dir s cell5_5 cell5_6) (in-dir s cell6_5 cell6_6) (in-dir s cell7_5 cell7_6) 
(in-dir d cell0_0 cell1_0) (in-dir d cell1_0 cell2_0) (in-dir d cell2_0 cell3_0) (in-dir d cell3_0 cell4_0) (in-dir d cell4_0 cell5_0) (in-dir d cell5_0 cell6_0) (in-dir d cell6_0 cell7_0) 
(in-dir d cell0_1 cell1_1) (in-dir d cell1_1 cell2_1) (in-dir d cell2_1 cell3_1) (in-dir d cell3_1 cell4_1) (in-dir d cell4_1 cell5_1) (in-dir d cell5_1 cell6_1) (in-dir d cell6_1 cell7_1) 
(in-dir d cell0_2 cell1_2) (in-dir d cell1_2 cell2_2) (in-dir d cell2_2 cell3_2) (in-dir d cell3_2 cell4_2) (in-dir d cell4_2 cell5_2) (in-dir d cell5_2 cell6_2) (in-dir d cell6_2 cell7_2) 
(in-dir d cell0_3 cell1_3) (in-dir d cell1_3 cell2_3) (in-dir d cell2_3 cell3_3) (in-dir d cell3_3 cell4_3) (in-dir d cell4_3 cell5_3) (in-dir d cell5_3 cell6_3) (in-dir d cell6_3 cell7_3) 
(in-dir d cell0_4 cell1_4) (in-dir d cell1_4 cell2_4) (in-dir d cell2_4 cell3_4) (in-dir d cell3_4 cell4_4) (in-dir d cell4_4 cell5_4) (in-dir d cell5_4 cell6_4) (in-dir d cell6_4 cell7_4) 
(in-dir d cell0_5 cell1_5) (in-dir d cell1_5 cell2_5) (in-dir d cell2_5 cell3_5) (in-dir d cell3_5 cell4_5) (in-dir d cell4_5 cell5_5) (in-dir d cell5_5 cell6_5) (in-dir d cell6_5 cell7_5) 
(in-dir d cell0_6 cell1_6) (in-dir d cell1_6 cell2_6) (in-dir d cell2_6 cell3_6) (in-dir d cell3_6 cell4_6) (in-dir d cell4_6 cell5_6) (in-dir d cell5_6 cell6_6) (in-dir d cell6_6 cell7_6) 
)
(:goal (and (ball cell3_2 )
(ball cell5_2 )
(ball cell3_4 )
(ball cell5_4 )
)))