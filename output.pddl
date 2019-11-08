(define (domain sokoban-sequential)
  (requirements :typing :negative-preconditions)
  (:types location - location direction - direction player_stone - object stone - stone player - player)
  (:predicates ?0 - location ?0 - location ?0 - location ?1 - location ?2 - direction ?0 - player_stone ?1 - location ?0 - location ?0 - stone)
  (:action move
           :parameters (?0player - ['player'] ?1location - ['location'] ?2location - ['location'] ?3direction - ['direction'])
           :precondition (and move-dir ?1location ?2location ?3direction at ?0player ?1location clear ?2location
                              (not move-dir ?2location ?2location ?3direction) (not at ?0player ?2location))
           :effect (and at ?0player ?2location clear ?1location
                        (not clear ?2location) (not at ?0player ?1location)))
  (:action push-to-goal
           :parameters (?0player - ['player'] ?1stone - ['stone'] ?2location - ['location'] ?3location - ['location'] ?4location - ['location'] ?5direction - ['direction'])
           :precondition (and is-goal ?4location move-dir ?2location ?3location ?5direction move-dir ?3location ?4location ?5direction at ?0player ?2location at ?1stone ?3location clear ?4location
                              (not is-nongoal ?4location) (not move-dir ?4location ?4location ?5direction) (not at ?0player ?4location) (not at ?1stone ?4location))
           :effect (and clear ?2location at ?0player ?3location at-goal ?1stone at ?1stone ?4location
                        (not at ?1stone ?3location) (not clear ?4location) (not at ?0player ?2location)))
  (:action push-to-nongoal
           :parameters (?0player - ['player'] ?1stone - ['stone'] ?2location - ['location'] ?3location - ['location'] ?4location - ['location'] ?5direction - ['direction'])
           :precondition (and is-nongoal ?4location move-dir ?2location ?3location ?5direction move-dir ?3location ?4location ?5direction at ?0player ?2location at ?1stone ?3location clear ?4location
                              (not is-goal ?4location) (not move-dir ?4location ?4location ?5direction) (not at ?0player ?4location) (not at ?1stone ?4location))
           :effect (and clear ?2location at ?0player ?3location at ?1stone ?4location
                        (not at ?1stone ?3location) (not clear ?4location) (not at ?0player ?2location) (not at-goal ?1stone)))
  )