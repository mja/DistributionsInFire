from distributions import *
from testing import assert_equal

def main():
  var x: Float64 = 1.7910264880
  try:
    assert_equal(erf(x), -erf(-x))
    print("erf assertions succeeded")
  except e:
    print(e)

