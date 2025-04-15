from math import e, pi, sqrt, factorial, log

# error function
# https://en.wikipedia.org/wiki/Error_function
fn erf[erfz: fn(Float64) -> Float64 = erf_dia](x: Float64) -> Float64:
  var z: Float64
  if(x >= 0):
    z = erfz(x)
  else:
    z = -erfz(-x)
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

# approximation from Dia 2023
# https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4487559
# for x >= 0
fn erfc_dia_pos(x: Float64) -> Float64:
  var erfcz: Float64
  erfcz = 0.56418958354775629 / (x + 2.06955023132914151) *
  (x**2 + 2.71078540045147805*x + 5.80755613130301624) / (x**2 + 3.47954057099518960*x + 12.06166887286239555) *
  (x**2 + 3.47469513777439592*x + 12.07402036406381411) / (x**2 + 3.72068443960225092*x + 8.44319781003968454) *
  (x**2 + 4.00561509202259545*x + 9.30596659485887898) / (x**2 + 3.90225704029924078*x + 6.36161630953880464) *
  (x**2 + 5.16722705817812584*x + 9.12661617673673262) / (x**2 + 4.03296893109262491*x + 5.13578530585681539) *
  (x**2 + 5.95908795446633271*x + 9.19435612886969243) / (x**2 + 4.11240942957450885*x + 4.48640329523408675) * (e ** (-x ** 2))
  return(erfcz)

# for x < 0
fn erfc_dia_neg(x: Float64) -> Float64:
  var erfcz: Float64
  erfcz = 2 - erfc_dia_pos(-x)
  return(erfcz)

# erfc Dia for positive and negative numbers
fn erfc_dia(x: Float64) -> Float64:
  var erfcz: Float64
  if(x >= 0):
    erfcz = erfc_dia_pos(x)
  else:
    erfcz = erfc_dia_neg(x)
  return(erfcz)

fn erf_dia(x: Float64) -> Float64:
  return(1 - erfc_dia(x))

# sign
fn sgn(x: Float64) -> Float64:
  if(x >= 0):
    return(1)
  else:
    return(-1)

# inverse erf (Winitzki approximation)
fn erfinv(x: Float64) -> Float64:
  var i: Float64
  var a: Float64 = (8 * (pi - 3)) / (3 * pi * (4 - pi))
  i = sgn(x) * sqrt(sqrt((2 / (pi * a) + log(1 - x ** 2) / 2) ** 2 - log(1 - x ** 2) / a ) - (2 / (pi * a) + log(1 - x**2)/2))
  return(i)