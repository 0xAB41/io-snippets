/*
 * Complex Number wrapper
 */
Complex := Object clone do(
    real ::= 0
    imag ::= 0

    + := method(other,
        other = other toComplex
        Complex clone setReal(real + other real)\
                    setImag(imag + other imag)
    )

    - := method(other,
        other = other toComplex
        Complex clone setReal(real - other real)\
                    setImag(imag - other imag)
    )

    * := method(other,
        other = other toComplex
        Complex clone setReal(real * other real - other imag * imag)\
                    setImag(real * other imag + imag * other real)
    )

    / := method(other,
        other = other toComplex
        divisor := other real * other real + other imag * other imag
        result_real := (real * other real + imag * other imag) / divisor
        result_imag := (- real * other imag + imag * other real) / divisor
        Complex clone setReal(result_real) setImag(result_imag)
    )

    == := method(other,
        other = other toComplex
        real == other real and imag == other imag
    )

    != := method(other,
        other = other toComplex
        real != other real or imag != other imag
    )

    toComplex := method(self)

    asSimpleString := method(
        write(real,if(imag >= 0, "+" .. imag, imag),"i")
    )
)

Number origAdd := Number getSlot("+")
Number + := method(other,
    if(other proto isIdenticalTo(Complex),
        toComplex + other,
        origAdd(other)
    )
)

Number origSub := Number getSlot("-")
Number - := method(other,
    if(other proto isIdenticalTo(Complex),
        toComplex - other,
        origSub(other)
    )
)

Number origMulti := Number getSlot("*")
Number * := method(other,
    if(other proto isIdenticalTo(Complex),
        toComplex * other,
        origMulti(other)
    )
)

Number origDiv := Number getSlot("/")
Number / := method(other,
    if(other proto isIdenticalTo(Complex),
        toComplex / other,
        origDiv(other)
    )
)

Number toComplex := method(
    Complex clone setReal(self)
)

Number i := method(
    Complex clone setImag(self)
)