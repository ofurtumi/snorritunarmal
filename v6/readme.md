# verkefnablað 6 - einstaklingsverkefni

forrit:  
```ocaml
(* 
  Notkun: powerList i j
  Fyrir:  i, j eru heiltölur.
  Gildi:  Listi lista [x1;x2;...;xN] sem
          inniheldur alla undirlista lista
          allra heiltalna k þ.a. i<=k<=j,
          í vaxandi röð. Ef i<=j þá er
          útkoman allir undirlistar listans
          [i;i+1;...;j].
          Ef i>j þá er útkoman [[]].
*)
let rec powerList i j = 
  if j == i-1
    then [[]]
    else 
      List.map (fun x -> i::x) (powerList (i + 1) j) 
      @ 
      (powerList (i+1) j)
    ;;
  ;;
;;
```

nokkrar keyrslur:  
```caml
powerList 2 5;;
- : int list list =
[[2; 3; 4; 5]; [2; 3; 4]; [2; 3; 5]; [2; 3]; [2; 4; 5]; [2; 4]; [2; 5]; 
 [2]; [3; 4; 5]; [3; 4]; [3; 5]; [3]; [4; 5]; [4]; [5]; []]

powerList 2 2;;
- : int list list = [[2]; []]

powerList 2 1;;
- : int list list = [[]]
```