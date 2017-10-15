(* ex12-1.ml *)
(* レコード型 eki_t *)
type eki_t = {
  namae : string;  (* 駅名・漢字 *)
  saitan_kyori : float;  (* 最短距離 *)
  temae_list : string list;  (* 駅名（漢字）のリスト *)
}
               
