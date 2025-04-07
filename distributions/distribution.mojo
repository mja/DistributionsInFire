
trait Distribution:
  """
  Distribution interface
  """
  fn pdf(self, x: Float64) -> Float64:
    ...
  fn cdf(self, q: Float64) -> Float64:
    ...
  fn ccdf(self, q: Float64) -> Float64:
    ...