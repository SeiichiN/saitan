(* ex14-9.ml *)

(* ex8-3.ml *)
type person_t = {
    name : string;
    height : float;
    weight : float;
    birth_m : int;
    birth_d : int;
    blood : string;
  }

let person1 = {
  name = "Yukiko";
  height = 1.55;
  weight = 45.0;
  birth_m = 9;
  birth_d = 21;
  blood = "A";
}

let person2 = {
  name = "Sonoko";
  height = 1.65;
  weight = 55.0;
  birth_m = 4;
  birth_d = 5;
  blood = "A";
}

let person3 = {
  name = "Kanae";
  height = 1.665;
  weight = 57.5;
  birth_m = 11;
  birth_d = 3;
  blood = "B";
}

                (* person_t型のデータを受け取ったら、名前フィールドを抜き出す無名関数をつくれ *)
                (* func : person_t -> string *)
let func  = fun person0 -> match person0 with
    {name = n; height = h; weight = w; birth_m = m; birth_d = d; blood = b} ->
    n

      (* テスト *)
let test1 = func person1 = "Yukiko"
let test2 = func person2 = "Sonoko"
let test3 = func person3 = "Kanae"
                             
