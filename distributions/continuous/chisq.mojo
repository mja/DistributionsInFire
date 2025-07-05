from math import e, pi, sqrt, gamma
from distributions.distribution import Distribution

# Chi-squared distribution
@value
struct ChiSq(Distribution):
  """
  ChiSq distribution.
  """
  var k: Float64

  fn pdf(self, x: Float64) -> Float64:
    """
    Probability density function.
    """

    var density: Float64
    density = 1 / (2 ** (self.k/2) * gamma(self.k / 2)) * x ** (self.k / 2 - 1) * e ** (-x/2)
    return(density)

  fn cdf(self, q: Float64) -> Float64:
    """
    Cumulative distribution function.
    """
    var distribution: Float64 = 0
    return(distribution)

  fn ccdf(self, q: Float64) -> Float64:
    """
    Complementary distribution function (1 - cdf(q)).
    """
    var distribution: Float64
    distribution = 1 - self.cdf(q)
    return(distribution)

  fn quantile(self, p: Float64) -> Float64:
    var q: Float64 = 0
    return(q)

  fn __add__(self, x: Float64, out chisq: ChiSq):
    pass
    
  fn __radd__(self, x: Float64, out chisq: ChiSq):
    pass

  fn __sub__(self, x: Float64, out chisq: ChiSq):
    pass

  fn __rsub__(self, x: Float64, out chisq: ChiSq):
    pass
  
  fn __mul__(self, x: Float64, out ChiSq: ChiSq):
    pass
    
  fn __rmul__(self, x: Float64, out ChiSq: ChiSq):
    pass