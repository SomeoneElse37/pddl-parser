(define (problem level2)
  (:domain soko2)
  (:objects cell0_0 cell1_0
            cell0_1 cell1_1
            cell0_2 cell1_2
            cell0_3 cell1_3 - cell
            w a s d - dir)
  (:init (player cell0_0)
         (ball cell0_1)
         (wall cell1_0)
         (in-dir s cell0_0 cell0_1)
         (in-dir s cell0_1 cell0_2)
         (in-dir s cell0_2 cell0_3)
         (in-dir s cell1_0 cell1_1)
         (in-dir s cell1_1 cell1_2)
         (in-dir s cell1_2 cell1_3)
         (in-dir w cell0_1 cell0_0)
         (in-dir w cell0_2 cell0_1)
         (in-dir w cell0_3 cell0_2)
         (in-dir w cell1_1 cell1_0)
         (in-dir w cell1_2 cell1_1)
         (in-dir w cell1_3 cell1_2)
         (in-dir d cell0_0 cell1_0)
         (in-dir d cell0_1 cell1_1)
         (in-dir d cell0_2 cell1_2)
         (in-dir d cell0_3 cell1_3)
         (in-dir a cell1_0 cell0_0)
         (in-dir a cell1_1 cell0_1)
         (in-dir a cell1_2 cell0_2)
         (in-dir a cell1_3 cell0_3))
  (:goal (ball cell0_0)))


;^#
;O 
;  
;  




