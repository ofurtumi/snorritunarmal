let rec foldr f x u = 
  if x == []
    then u
    else f (List.hd x) (foldr f (List.tl x) u) 
;;