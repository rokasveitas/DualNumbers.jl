module DualNumbers

export Dual

"""
	Dual: A dual number
"""

struct Dual{T}
	real::T
	dual::T
end

Base.:+(x::Dual) = Dual(+x.real, +x.dual)
Base.:-(x::Dual) = Dual(-x.real, -x.dual)

Base.:+(x::Dual, y::Dual) = Dual(x.real + y.real, x.dual + y.dual)
Base.:-(x::Dual, y::Dual) = x + -y

Base.:*(x::Dual, y::Dual) = Dual(x.real * y.real, x.dual*y.real + x.real*y.dual)
Base.inv(x::Dual) = Dual(inv(x.real), -x.dual / x.real^2)
Base.:/(x::Dual, y::Dual) = x * inv(y)

Base.:*(x::Number, y::Dual) = Dual(x * y.real, x * y.dual)


end # module DualNumbers
