from distributions import *
from testing import assert_equal, assert_not_equal, assert_almost_equal

def main():
  var x: Float64 = 1.7910264880
  try:
    assert_equal(erf(x), -erf(-x))
    assert_equal(erf[1](x), -erf[1](-x))
    assert_equal(erf[10](x), -erf[10](-x))
    assert_not_equal(erf[1](x), erf[21](x))
    assert_almost_equal(erf[20](x), erf[21](x))
    print("erf assertions succeeded")
  except e:
    print(e)

