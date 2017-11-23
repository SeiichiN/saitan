(* ex17-10.ml *)
(* 木の節に 
  1) 漢字の駅名
  2) 「その駅に直接つながっている駅名（漢字）」と「その駅までの距離」の組のリスト
 をもつ木の型 ekikan_tree_t を宣言せよ。構成子は Empty と Node のみとする。 *)
type ekikan_tree_t = Empty
                   | Node of ekikan_tree_t * string * ( string * float ) list * ekikan_tree_t
