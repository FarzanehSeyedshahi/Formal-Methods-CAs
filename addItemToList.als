sig item{}
sig product{}
sig list{
  items: item -> one product
}

pred addItem (l1, l2: list, i: item, p: product){
	l2.items = l1.items + i -> p
}

assert addIdempotent{
	all l1, l2, l3: list, i: item, p: product|
		addItem[l1, l2, i, p] and addItem[l2, l3, i, p] implies l2.items = l3.items
}

check addIdempotent for 10 but 3 list
