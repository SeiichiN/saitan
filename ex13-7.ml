(* ex13-7.ml *)

#use "ex13-6.ml"

(* 目的：直前に確定した駅ｐ(eki_t型)と、未確定の駅のリストｖ(eki_t list型)
を受け取ったら、必要な更新処理をおこなった後の未確定の駅のリストを返す *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin p v =
  List.map (koushin1 p) v 
     
(* テスト *)
(* s = "銀座" *)
let test1 = koushin s tmp_eki_list7 =
  [{namae = "青山一丁目"; saitan_kyori = infinity; temae_list = []};
   {namae = "赤坂"; saitan_kyori = infinity; temae_list = []};
   {namae = "大手町"; saitan_kyori = infinity; temae_list = []};
   {namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]};
   {namae = "霞ヶ関"; saitan_kyori = 1.; temae_list = ["霞ヶ関";  "銀座"]};
   {namae = "九段下"; saitan_kyori = infinity; temae_list = []};
   {namae = "国会議事堂前"; saitan_kyori = infinity; temae_list = []};
   {namae = "神保町"; saitan_kyori = infinity; temae_list = []};
   {namae = "永田町"; saitan_kyori = infinity; temae_list = []};
   {namae = "二重橋前"; saitan_kyori = infinity; temae_list = []};
   {namae = "乃木坂"; saitan_kyori = infinity; temae_list = []};
   {namae = "半蔵門"; saitan_kyori = infinity; temae_list = []};
   {namae = "日比谷"; saitan_kyori = 0.4; temae_list = ["日比谷"; "銀座"]};
   {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []};
   {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
   {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}]
              
