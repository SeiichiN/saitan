(* ex17-13.ml *)

#use "ex17-12.ml"

let ekikan_tree_first =
  Node (Empty, "", [], Empty)

(* Node (Empty, "", [], *)
(*       Node (Node (Empty, "新大塚", [("池袋", 1.8)], Empty), "池袋", *)
(*             [("新大塚", 1.8)], Empty)) *)

(* let ekikan_tree_1st = *)
(* Node (Empty, "", [], *)
(*  Node *)
(*   (Node (Empty, "新大塚", [("池袋", 1.8); ("茗荷谷", 1.2)], Empty), *)
(*   "池袋", [("新大塚", 1.8)], *)
(*   Node (Empty, "茗荷谷", [("新大塚", 1.2)], Empty))) *)

       
     
let ekikan_tmp_list = [
  {kiten="池袋"; shuten="新大塚"; keiyu="丸ノ内線"; kyori=1.8; jikan=3}; 
  {kiten="新大塚"; shuten="茗荷谷"; keiyu="丸ノ内線"; kyori=1.2; jikan=2}; 
  {kiten="茗荷谷"; shuten="後楽園"; keiyu="丸ノ内線"; kyori=1.8; jikan=2}; 
]


(* ekikan_tree_t 型の木と ekikan_t list型の駅間のリストを受け取ったら
リストの中に含まれる駅間をすべて挿入した木を返す *)
(* inserts_ekikan: ekikan_tree_t tree -> ekikan_t list -> ekikan_tree_t tree *)
let inserts_ekikan tree lst = List.fold_left insert_ekikan tree lst
(* let inserts_ekikan tree lst = List.fold_right (fun ekikan tree0-> insert_ekikan tree0 ekikan) lst tree *)

                       
(* テスト *)
let test1 =
  inserts_ekikan ekikan_tree_first ekikan_tmp_list =
    Node (Empty, "", [],
          Node
            (Node
               (Node (Empty, "後楽園", [("茗荷谷", 1.8)], Empty),
                "新大塚", [("池袋", 1.8); ("茗荷谷", 1.2)], Empty),
             "池袋", [("新大塚", 1.8)],
             Node
               (Empty, "茗荷谷", [("新大塚", 1.2); ("後楽園", 1.8)], Empty)))



    (* [Node (Empty, "", [], *)
    (*        Node *)
    (*          (Node (Empty, "新大塚", [("池袋", 1.8)], Empty), *)
    (*           "池袋", [("新大塚", 1.8)], Empty)); *)
    (*  Node (Empty, "", [], *)
    (*        Node (Empty, "新大塚", [("茗荷谷", 1.2)], *)
    (*              Node (Empty, "茗荷谷", [("新大塚", 1.2)], Empty))); *)
    (*  Node (Empty, "", [], *)
    (*        Node (Node (Empty, "後楽園", [("茗荷谷", 1.8)], Empty), "茗荷谷", *)
    (*              [("後楽園", 1.8)], Empty))] *)



    
         
