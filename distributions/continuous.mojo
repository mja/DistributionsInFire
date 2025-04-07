from math import e, pi, sqrt

# Normal distribution
@value
struct Normal:
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
    
