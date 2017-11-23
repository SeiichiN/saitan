(* ex17-12.ml *)

#use "metro.ml"

#use "ex17-10.ml"               (* type ekikan_tree_t *)

let ekikan1 = {kiten="池袋"; shuten="新大塚"; keiyu="丸ノ内線"; kyori=1.8; jikan=3}
let ekikan2 = {kiten="新大塚"; shuten="茗荷谷"; keiyu="丸ノ内線"; kyori=1.2; jikan=2}
let ekikan3 = {kiten="茗荷谷"; shuten="後楽園"; keiyu="丸ノ内線"; kyori=1.8; jikan=2}
let ekikan4 = {kiten="後楽園"; shuten="本郷三丁目"; keiyu="丸ノ内線"; kyori=0.8; jikan=1}

let ekikan_tree_sample = Node ( Empty, "茗荷谷", [("新大塚", 1.2); ("後楽園", 1.8)], Empty)

(* type setsuzoku_t = (string, float) *)
                                                                                
(* 目的：接続リストになければ追加。あれば何もしない。 *)
(* add_setuzoku: string -> float -> setsuzoku_t list -> setsuzoku_t list *)
let rec add_setsuzoku (eki0, kyori0) lst = match lst with
    [] -> (eki0, kyori0)::[]
  | (eki, kyori) as first::rest ->
     if eki = eki0 then lst
     else first :: add_setsuzoku (eki0, kyori0) rest

let setsuzoku_list1 = [("後楽園", 1.2); ("新大塚", 1.8)]
                                               
(* テスト *)
let test11 = add_setsuzoku ("茗荷谷", 1.8) setsuzoku_list1 =
               [ ("後楽園", 1.2); ("新大塚", 1.8); ("茗荷谷", 1.8)]
let test12 = add_setsuzoku ("新大塚", 1.8) setsuzoku_list1 = [("後楽園", 1.2); ("新大塚", 1.8)]

(* 目的：ekikan_tree_t 型のリストと起点の駅名、終点の敵名、そのあいだの距離を受け取ったら、
起点の駅名がリストの中にあるかを調べ、あったら、終点の駅が終点リストの中になければ追加する。
なかったら、起点の駅と終点の駅とその距離のリストを木に加える。 *)
(* insert1_ekikan: ekikan_tree_t tree -> string -> string -> float -> ekikan_tree_t tree *)
let rec insert1_ekikan tree kiten shuten kyori = match tree with
    Empty -> Node (Empty, kiten, [shuten, kyori], Empty)
  | Node (t1, ekimei, lst, t2) ->
     if ekimei = kiten then Node (t1, ekimei, add_setsuzoku (shuten, kyori) lst, t2)
     else if ekimei > kiten then
       Node ( insert1_ekikan t1 kiten shuten kyori, ekimei, lst, t2)
     else
       Node ( t1, ekimei, lst, insert1_ekikan t2 kiten shuten kyori)

                                                               
(* ekikan_tree_t 型の木と、ekikan_t 型の駅間を受け取ったら、その情報を挿入した
木を返す *)
(* insert1_ekikan: ekikan_tree_t tree -> ekikan_t -> ekikan_tree_t tree *)
let insert_ekikan tree ekikan = match ekikan with
    {kiten = k; shuten = s; kyori = r; jikan = j} ->
    insert1_ekikan (insert1_ekikan tree k s r) s k r
            

(* テスト *)
let test1 = insert_ekikan Empty ekikan3 =
              Node ( Node( Empty, "後楽園", [("茗荷谷", 1.8)], Empty),
                     "茗荷谷", [("後楽園", 1.8)], Empty )

let test2 = insert_ekikan ekikan_tree_sample ekikan2 =
             Node ( Node ( Empty, "新大塚", [("茗荷谷", 1.2)], Empty),
                    "茗荷谷", [("新大塚", 1.2); ("後楽園", 1.8)], Empty)
                  
(* 疑問点 *)
(* この木をつくる際の大小関係がわからない。一応、解答例どおりにしてある。
すなわち、39行目、42行目。 *)
