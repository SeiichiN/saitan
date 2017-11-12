(* ex15-5.ml *)
(* あらかじめ ex12_1.ml を読み込んでおく必要あり *) 
(* #use "ex12-1.ml" *) (* eki_t の定義 *) 
 
(* 目的：受け取った駅のリストを、最短距離最小の駅とそれ以外に分離する *) 
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *) 
(*
let saitan_wo_bunri eki_list = 
  List.fold_right (fun first (p, v) -> 
		     match (first, p) with 
		       ({namae = fn; saitan_kyori = fs; temae_list = ft}, 
			{namae = sn; saitan_kyori = ss; temae_list = st}) -> 
			 if sn = "" then (first, v) 
			 else if fs < ss then (first, p :: v) 
			 else (p, first :: v)) 
		  eki_list 
		  ({namae = ""; saitan_kyori = infinity; temae_list = []}, []) 
 *) 

(* あるいは *) 
 
(* 目的：受け取った駅のリストを、最短距離最小の駅とそれ以外に分離する *) 
(* saitan_wo_bunri : eki_t list -> eki_t * eki_t list *) 

let saitan_wo_bunri eki_list = match eki_list with 
    [] -> ({namae = ""; saitan_kyori = infinity; temae_list = []}, []) 
  | first :: rest -> 
      List.fold_right (fun first (p, v) -> 
			 match (first, p) with 
			   ({namae = fn; saitan_kyori = fs; temae_list = ft}, 
			    {namae = sn; saitan_kyori = ss; temae_list = st}) -> 
			     if fs < ss then (first, p :: v) 
			     else (p, first :: v)) 
		      rest 
		      (first, []) 

          
(* 駅の例 *) 
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []} 
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]} 
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]} 
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []} 
 
(* 駅リストの例 *) 
let lst = [eki1; eki2; eki3; eki4] 

let tmp_eki_list7 = [
    {namae = "青山一丁目"; saitan_kyori = infinity; temae_list = []};
    {namae = "赤坂"; saitan_kyori = infinity; temae_list = []};
    {namae = "大手町"; saitan_kyori = infinity; temae_list = []};
    {namae = "表参道"; saitan_kyori = 0.; temae_list = ["表参道"]};
    {namae = "霞ヶ関"; saitan_kyori = infinity; temae_list = []};
    {namae = "九段下"; saitan_kyori = infinity; temae_list = []};
    {namae = "国会議事堂前"; saitan_kyori = infinity; temae_list = []};
    {namae = "神保町"; saitan_kyori = infinity; temae_list = []};
    {namae = "永田町"; saitan_kyori = infinity; temae_list = []};
    {namae = "二重橋前"; saitan_kyori = infinity; temae_list = []};
    {namae = "乃木坂"; saitan_kyori = infinity; temae_list = []};
    {namae = "半蔵門"; saitan_kyori = infinity; temae_list = []};
    {namae = "日比谷"; saitan_kyori = infinity; temae_list = []};
    {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []};
    {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
    {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []};
  ]
            
            
(* テスト *) 
let test = saitan_wo_bunri lst = (eki3, [eki2; eki1; eki4]) 
 
(* ex15_4.ml の最後のコメントに書いた通り、[eki2; eki1; eki4] の順番には 
   意味がない。実際、ここで得られた結果は ex15_4.ml で得られた結果と比べ 
   ると順番が異なっている。これは、答えに任意性がある場合の本書のテスト 
   法の限界を示している。*) 

let tmp_eki_list8 =
[{namae = "青山一丁目"; saitan_kyori = 1.4; temae_list = ["青山一丁目"; "表参道"]};
 {namae = "赤坂"; saitan_kyori = infinity; temae_list = []};
 {namae = "大手町"; saitan_kyori = infinity; temae_list = []};
 {namae = "霞ヶ関"; saitan_kyori = infinity; temae_list = []};
 {namae = "九段下"; saitan_kyori = infinity; temae_list = []};
 {namae = "国会議事堂前"; saitan_kyori = infinity; temae_list = []};
 {namae = "神保町"; saitan_kyori = infinity; temae_list = []};
 {namae = "永田町"; saitan_kyori = infinity; temae_list = []};
 {namae = "二重橋前"; saitan_kyori = infinity; temae_list = []};
 {namae = "乃木坂"; saitan_kyori = 1.4; temae_list = ["乃木坂"; "表参道"]};
 {namae = "半蔵門"; saitan_kyori = infinity; temae_list = []};
 {namae = "日比谷"; saitan_kyori = infinity; temae_list = []};
 {namae = "明治神宮前"; saitan_kyori = 0.9; temae_list = ["明治神宮前"; "表参道"]};
 {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
 {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}]
                                   
