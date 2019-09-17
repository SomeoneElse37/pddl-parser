(define (problem pb1)

  (:init (ROOM rooma) (ROOM roomb)
         (BALL ball1) (BALL ball2) (BALL ball3) (BALL ball4)
         (GRIPPER left) (GRIPPER right) (free left) (free right)
         (at-robby rooma)
         (at-ball ball1 rooma) (at-ball ball2 rooma)
         (at-ball ball3 rooma) (at-ball ball4 rooma))

  (:goal (and (at-ball ball1 roomb)
              (at-ball ball2 roomb)
              (at-ball ball3 roomb)
              (at-ball ball4 roomb)))
  )
