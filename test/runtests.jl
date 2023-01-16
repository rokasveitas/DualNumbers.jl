using DualNumbers
using Test

x = Dual(1,2)
y = Dual(2,3)
xf = Dual(1., 2.)

@test +x == x
@test -x == Dual(-1, -2)

@test x + y == Dual(3,5)
@test x - y == Dual(-1, -1)

@test x * y == Dual(2, 7)
@test inv(x) * x == Dual(1., 0.)
@test y * 5 == Dual(10, 15)
@test y / x == Dual(2., 2.)

#@test inv(x) == Dual(1., -0.4)
