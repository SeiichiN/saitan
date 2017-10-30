(* ex16-4.ml *)
(* 目的：eki_t list型の（未確定の）駅のリストと ekikan_t list型の駅間のリストを
受け取ったら、ダイクストラのアルゴリズムにしたがって各駅について最短距離と
最短経路が正しく入ったリスト（eki_t list型）を返す *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
let  dijkstra_main lst = match lst with
    [] -> []
  | first :: rest -> []

(* テスト *)
let test1 = dijkstra_main [] = []
                               
