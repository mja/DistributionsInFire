# Error function

The **[error function](https://en.wikipedia.org/wiki/Error_function)** is defined as

$$\mathrm{erf} z = \frac{2}{\sqrt{\pi}} = \int_0^z e^{-t^2} \mathop{dt}$$

which has a [Taylor series](https://en.wikipedia.org/wiki/Error_function#Taylor_series):

$$\mathrm{erf} z = \frac{2}{\sqrt{\pi}} = \sum_{n=0}^\infty \frac{(-1)^n z^{2n+1}}{n!(2n + 1)}$$

## glibc

Source [`sysdeps/ieee754/dbl-64/s_erf.c`](https://elixir.bootlin.com/glibc/glibc-2.41/source/sysdeps/ieee754/dbl-64/s_erf.c)

Uses different formula across intervals ([0, 0.84375], [0.84375,1.25], [1.25,1/0.35(~2.857143)], [1/0.35,28], [28, Inf]).

## Julia

Source [`SpecialFunctions.jl/blob/master/src/erf.jl`](https://github.com/JuliaMath/SpecialFunctions.jl/blob/master/src/erf.jl). Uses "C standard math library". 

## R

[pracma](https://cran.r-project.org/web/packages/pracma/index.html) library:

```r
erf
function (x) 
{
    pchisq(2 * x^2, 1) * sign(x)
}
<bytecode: 0x126832c18>
<environment: namespace:pracma>
```