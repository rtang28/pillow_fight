open Js
open Js_of_ocaml
module Html = Dom_html

let rec update_all context =
  let rec loop st ai = let st'' = Ai.update_ai st ai in
    let st' = State.update_st st'' in
    if st'.game_over = true then
      begin
        match State.highest_score st'.mcup st'.bloom st'.soap with
        | "mcup" -> Display.draw_winscreen context "mcup"; exit 0
        | "bloom" -> Display.draw_winscreen context "bloom"; exit 0
        | "soap" -> Display.draw_winscreen context "soap"; exit 0
        | "tie" -> Display.draw_winscreen context "tie"; exit 0
        | _ -> print_endline "failed"
      end
    else
    Display.draw_state context st';
    ignore (Html.window##requestAnimationFrame(
      Js.wrap_callback (fun (t:float) -> loop st' ai)
    ))
in loop State.init_st Ai.init_ai

let initialize () =
  let canvas = Opt.get(
      Opt.bind(Dom_html.document##getElementById(string "canvas"))
        Dom_html.CoerceTo.canvas) (fun _ -> assert false) in
  let context = canvas##getContext (Dom_html._2d_) in
  let _ = Dom_html.addEventListener Dom_html.document Dom_html.Event.keydown
      (Dom_html.handler State.keydown) _true in
  let _ = Dom_html.addEventListener Dom_html.document Dom_html.Event.keyup
      (Dom_html.handler State.keyup) _true in
  update_all context

let _ = initialize ()
