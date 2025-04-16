from math import e, pi, sqrt
from .distribution import Distribution

# Normal distribution
@value
struct Normal(Distribution):
  """
  Normal distribution.
  """
  var mu: Float64
  var sigma: Float64

  fn pdf(self, x: Float64) -> Float64:
    """
    Probability density function.
    """

    var density: Float64
    density = 1 / sqrt(2.0 * pi * self.sigma ** 2) * e ** (-(x - self.mu) ** 2 / (2 * self.sigma ** 2))
    return(density)

  fn cdf(self, q: Float64) -> Float64:
    """
    Cumulative distribution function.
    """
    var distribution: Float64
    distribution = 1/2 * (1 + erf((q - self.mu)/(self.sigma * sqrt(2.0))))
    return(distribution)

  fn ccdf(self, q: Float64) -> Float64:
    """
    Complementary distribution function (1 - cdf(q)).
    """
    var distribution: Float64
    distribution = 1 - self.cdf(q)
    return(distribution)

  fn quantile(self, p: Float64) -> Float64:
    var q: Float64
    q = self.mu + self.sigma * sqrt(2.0) * erfinv(2 * p - 1)
    return(q)

  fn __add__(self, x: Float64, out normal: Normal):
    normal = Normal(self.mu + x, self.sigma)
    
  fn __radd__(self, x: Float64, out normal: Normal):
    normal = self + x

  fn __sub__(self, x: Float64, out normal: Normal):
    normal = self + (-x)

  fn __rsub__(self, x: Float64, out normal: Normal):
    normal = Normal(x - self.mu, self.sigma)