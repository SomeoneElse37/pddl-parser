(define (domain soko2)
  (:requirements :strips :typing :negative-preconditions)

  (:types cell  ; A cell in the grid
          dir)  ; A direction the player can move in. These shall be listed in the problem file, and the engine will expect the player to type those exact same direction strings.
                ; I recommend listing 'w', 'a', 's', and 'd' as the available directions. 'q', 'e', 'z', and 'c' will eventually be supported for diagonal movement.

  ; The only objects here are cells. Their contents are determined by predicates.
  ; All walkable floor tiles have (floor).
  ; Otherwise-walkable floor tiles with a ball or player additionally have (ball) or (player), respectively.
  ; Goal tiles don't have a predicate; they're only specified in the :goal section of the problem file.
  ; Walls only have (wall).
  ; The (north) and (west) predicates encode how the tiles are connected.
  ; Read (north ?n ?s) as "Tile ?n is due north of and adjacent to tile ?s".
  (:predicates (wall ?c - cell)     ; This cell is a wall.
               (player ?c - cell)   ; This cell contains the player.
               (ball ?c - cell)     ; This cell has a boulder in it.
               (pit ?c - cell)      ; This cell is a pit.
               ; A cell may have at most one of the above predicates.
               ; Cells with none of the above predicates are considered "walkable floor".
               (in-dir ?d - dir ?f ?t - cell))  ; Declares how cells are connected- read (in-dir ?d ?f ?t) as "By moving one step in direction ?d from cell ?f, you will get to cell ?t".

  ; The player can move from their cell to any connected walkable cell
  (:action move :parameters (?d - dir ?f - cell ?t - cell)
           :precondition (and (player ?f) (in-dir ?d ?f ?t)
                              (not (wall ?t)) (not (ball ?t)) (not (pit ?t)))
           :effect       (and (player ?t)
                              (not (player ?f))))

  ; The player can push at most one boulder from its cell into a walkable cell behind it
  (:action push :parameters (?d - dir ?f - cell ?m - cell ?t - cell)
           :precondition (and (player ?f) (ball ?m) (in-dir ?d ?f ?m) (in-dir ?d ?m ?t)
                              (not (wall ?t)) (not (ball ?t)) (not (pit ?t)))
           :effect       (and (player ?m) (ball ?t)
                              (not (player ?f)) (not (ball ?m))))

  ; The player can fill a pit by pushing a boulder into it
  (:action drop :parameters (?d - dir ?f - cell ?m - cell ?t - cell)
           :precondition (and (player ?f) (ball ?m) (pit ?t) (in-dir ?d ?f ?m) (in-dir ?d ?m ?t))
           :effect       (and (player ?m)
                              (not (player ?f)) (not (ball ?m)) (not (pit ?t)))))



