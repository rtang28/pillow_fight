(* This file will handle all of the GUI and the actual pictures, sprites, etc.
   for all objects. Many of these functions have type (unit -> unit) because
   they are purely "side effects" from our current understanding of our project
*)

(* this function will display the initial menu that players see when they
   first open the game. *)
val load_screen : unit -> unit

(* this function will prep all of the graphic elements that will be displayed
   on screen. the following list should be comprehensive:
   - sprites of girls, pillows, walls, background, professor and bed
   - scores
   - timers
   - grid
*)
val init_display : unit -> unit

(* this function will update the display based on the new information received
   from the state. For example, if the state indicates a collision between
   two girls, then the display will be updated accordingly to make sure
   one sprite is on top of the other. Another example: the timer will be updated
   every second as the game progresses *)
val update_display: state -> unit

(* this function will be called once the game is over and show the screen that
   shows 1st, 2nd, and 3rd place, as well as a button to go back to the main
   menu, etc. *)
val game_over_display : unit -> unit