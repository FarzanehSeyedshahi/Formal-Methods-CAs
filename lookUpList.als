sig item{}
sig product{}
sig list{
 items : item -> one product
}
fun  lookup [ l : list] : set product{
  univ.(l.items) & product
}
pred show{
all l: list | some lookup [l] 
}

run show for 3
