open List;;

let reverse x =
  let rec revapp x y =
    if x = [] then
      y
    else
      revapp (tl x) ((hd x ) :: y)
  in
    revapp x []
;;
reverse [1;2;3;4;5];;