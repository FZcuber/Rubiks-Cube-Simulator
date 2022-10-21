(*Use '#require "graphics"' in utop before running code*)
open Graphics;;

open_graph " 1000x1000"
(**positions 0-8 of a face array represent the following
   0 = bottom left of face
   1 = bottom middle of face 
   2 = bottom right of face
   3 = middle left of face
   4 = center of face
   5 = middle right of face
   6 = top left of face
   7 = top middle of face
   8 = top right of face
*)
type color = White | Red | Blue | Orange | Yellow | Green 
let white_face = [|White;Red;Blue;Blue;Yellow;Green;Red;Blue;Green|]
let red_face = [|Red;Red;Red;Red;Red;Red;Red;Red;Red|]
let blue_face = [|Blue;Blue;Blue;Blue;Blue;Blue;Blue;Blue;Blue|]
let orange_face = [|Orange;Orange;Orange;Orange;Orange;Orange;Orange;Orange;Orange|]
let yellow_face = [|Yellow;Yellow;Yellow;Yellow;Yellow;Yellow;Yellow;Yellow;Yellow|]
let green_face = [|Green;Green;Green;Green;Green;Green;Green;Green;Green|]

let cube = [|white_face; red_face; blue_face; orange_face; yellow_face; green_face|]
let set_color = function
| White -> set_color magenta 
| Red -> set_color red 
| Green -> set_color green 
| Orange -> set_color (rgb 255 165 0) 
| Yellow -> set_color yellow 
| Blue -> set_color blue 
let turn_clock = function 
[|a;b;c;d;e;f;g;h;i |] -> [|c;f;i;b;e;h;a;d;g|]
|_ -> failwith "invalid"
let turn_counter = function
[|a;b;c;d;e;f;g;h;i |] -> [|g;d;a;h;e;b;i;f;c|]
|_ -> failwith "invalid"

let draw_2dcube cb =
    for j=0 to 8 do 
      set_color (turn_counter cb.(0)).(j);
      match j mod 3 with
      0 ->  fill_rect (350) (j/3 * 100 + 350) 100 100;
      | 1 -> fill_rect (450) (j/3 * 100 + 350) 100 100;
      | 2 -> fill_rect (550) (j/3 * 100 + 350) 100 100;
      | _ -> failwith "invalid"
  done ;;
draw_2dcube cube;
moveto 100 100;
Graphics.set_color black;
fill_rect 450 350 10 300;
fill_rect 650 350 10 310;
fill_rect 550 350 10 300;
fill_rect 350 550 300 10;
fill_rect 350 450 300 10;
fill_rect 350 650 300 10;
fill_rect 350 350 10 300;
fill_rect 350 350 300 10;


(* let cube_rep_r =
  [| [| [| "R"; "R"; "R" |]; [| "R"; "R"; "R" |]; [| "R"; "R"; "R" |] |] |]

let () = cube_rep_r |> Array.iter (Array.iter print_endline) *)

(*Create *) 