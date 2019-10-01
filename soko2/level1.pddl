(define (problem level1)
  (:domain soko2)
  (:objects cell0_0 cell0_1 cell0_2 - cell
            w s - dir)
  (:init (ball cell0_1)
         (player cell0_2)
         (in-dir s cell0_0 cell0_1)
         (in-dir s cell0_1 cell0_2)
         (in-dir w cell0_1 cell0_0)
         (in-dir w cell0_2 cell0_1))
  (:goal (ball cell0_0)))






