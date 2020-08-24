sig item{}
sig product{}
sig list{
  items: item -> one product
}
pred show[l:list]{ ~(l.items).(l.items) not in iden} 
run show for 3
