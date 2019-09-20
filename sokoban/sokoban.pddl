(define (domain sokoban)

  ; The only objects here are cells. Their contents are determined by predicates.
  ; All walkable floor tiles have (floor).
  ; Otherwise-walkable floor tiles with a ball or player additionally have (ball) or (player), respectively.
  ; Goal tiles don't have a predicate; they're only specified in the :goal section of the problem file.
  ; Walls only have (wall).
  ; The (north) and (west) predicates encode how the tiles are connected.
  ; Read (north ?n ?s) as "Tile ?n is due north of and adjacent to tile ?s".
  (:predicates (floor ?c) (wall ?c) (ball ?c) (player ?c)
               (north ?n ?s) (west ?w ?e))

  ; All move actions have syntax (moveDir ?fromTile ?toTile)
  (:action moveNorth :parameters (?f ?t)
           :precondition (and (player ?f) (floor ?t) (not (ball ?t))
                              (north ?t ?f))
           :effect       (and (not (player ?f)) (player ?t)))

  (:action moveSouth :parameters (?f ?t)
           :precondition (and (player ?f) (floor ?t) (not (ball ?t))
                              (north ?f ?t))
           :effect       (and (not (player ?f)) (player ?t)))
 
  (:action moveWest :parameters (?f ?t)
           :precondition (and (player ?f) (floor ?t) (not (ball ?t))
                              (west ?t ?f))
           :effect       (and (not (player ?f)) (player ?t)))
 
  (:action moveEast :parameters (?f ?t)
           :precondition (and (player ?f) (floor ?t) (not (ball ?t))
                              (west ?f ?t))
           :effect       (and (not (player ?f)) (player ?t)))

  ; All push actions have the syntax (pushDir ?playerTile ?ballTile ?floorTile)
  (:action pushNorth :parameters (?p ?b ?f)
           :precondition (and (player ?p) (ball ?b) (floor ?f) (not (ball ?f))
                              (north ?b ?p) (north ?f ?b))
           :effect       (and (player ?b) (ball ?f)
                              (not (player ?p)) (not (ball ?b))))

  (:action pushSouth :parameters (?p ?b ?f)
           :precondition (and (player ?p) (ball ?b) (floor ?f) (not (ball ?f))
                              (north ?p ?b) (north ?b ?f))
           :effect       (and (player ?b) (ball ?f)
                              (not (player ?p)) (not (ball ?b))))

  (:action pushWest :parameters (?p ?b ?f)
           :precondition (and (player ?p) (ball ?b) (floor ?f) (not (ball ?f))
                              (west ?b ?p) (west ?f ?b))
           :effect       (and (player ?b) (ball ?f)
                              (not (player ?p)) (not (ball ?b))))

  (:action pushEast :parameters (?p ?b ?f)
           :precondition (and (player ?p) (ball ?b) (floor ?f) (not (ball ?f))
                              (west ?p ?b) (west ?b ?f))
           :effect       (and (player ?b) (ball ?f)
                              (not (player ?p)) (not (ball ?b)))))





