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
  (*
    Notkun: listMaker i j x
    Fyrir:  i og j eru heiltölur, x er listi sem mun vera bætt í
    Gildi:  Listi af vaxandi heiltölum frá og með i til og með j 
            sem er consað við lista x
            (* listMaker 2 3 [4;6]*) skilar listanum [2;3;4;5]
  *)
  let rec listMaker i j x =
    if i == j 
    then 
      [i::x]
    else 
      listMaker i (j-1) (j::x)  
in
  if i > j then []
  else (powerList i (j-1)) @ (listMaker i j [])
;;
```

nokkrar keyrslur:  
```caml
powerList 7 13;;
- : int list list =
[[7]; [7; 8]; [7; 8; 9]; [7; 8; 9; 10]; [7; 8; 9; 10; 11];
 [7; 8; 9; 10; 11; 12]; [7; 8; 9; 10; 11; 12; 13]]
 
powerList 7 1;;
- : int list list = []
```