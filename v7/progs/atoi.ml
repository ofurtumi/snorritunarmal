let rec atio n =
  let rec inner i acc =
    if i > n
      then acc
  else inner (i+1) (i::acc)
in inner 1 []    