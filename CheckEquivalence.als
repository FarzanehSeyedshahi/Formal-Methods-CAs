
pred transCover (R, r: univ -> univ) {
     r in R
     R.R in R
}
pred transClosure  [R, r: univ -> univ]{
     transCover[R , r]
     all x, y: univ | (x->y) in R => !transCover[(R-(x->y)), r]
}
assert Equivalence {
       all R, r: univ -> univ | transClosure [R, r] iff R = ^r
       }
check Equivalence for 3
/*

با داشتن رابطه r میتوان رابطه R را پیدا کرد
 روشی که ما استفاده میکنیم minimal است و مینیمم نمیشود.

به عبارتی ما یک مجموعه انتخاب میکنیم و میگیم از این کوچکتر نمیشود در حالیکه  کلا ممکن است یک مجموعه دیگر بوده باشد و ما  آن را در نظر گرفتیم!

رابطه R
یک minimal transitive cover of r
است.
 اما ممکن است یک رابطه خیلی کوچکترباشد که 
 transClosure
باشد.
و ما آن را پیدا نمیکنیم چون فقط زیرمجموعه هایی را چک میکنیم که یک تاپل کمتر دارند
*/
