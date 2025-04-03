from math import e, pi, sqrt, factorial

# error function
# https://en.wikipedia.org/wiki/Error_function
fn erf[k: Int = 21](x: Float64) -> Float64:
  var z: Float64
  if(x >= 0):
    z = erf_taylor[k](x)
  else:
    z = -erf_taylor[k](-x)
  return(z);

# error function via parameterised Taylor series expansion
# https://en.wikipedia.org/wiki/Error_function#Taylor_series
fn erf_taylor[k: Int = 21](x: Float64) -> Float64:
  var erf_fact: Float64 = 0.0
  var erfz: Float64
  for n in range(k):
    erf_fact += ((-1) ** n * x ** (2 * n + 1)) / (factorial(n) * (2 * n + 1))
  erfz = 2 / sqrt(pi) * erf_fact
  return(erfz)