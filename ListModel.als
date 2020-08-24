sig item{}
sig product{}
sig list{
  items: item -> one product
}
pred show(){}
run show for 3
