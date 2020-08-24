sig item{}
sig product{}
sig list{
 items : item -> one product
}
pred show{
all l : list |not ( lone univ.(l.items) )
}
run show for 4
