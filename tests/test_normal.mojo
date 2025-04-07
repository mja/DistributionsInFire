from distributions import *
from testing.testing import (
    assert_true,
    assert_almost_equal,
    assert_equal,
    assert_not_equal,
    assert_raises,
    assert_is
)

def test_normal_create():
  normal = Normal(0.0, 1.0)
  assert_equal(normal.mu, 0.0)
  assert_equal(normal.sigma, 1.0)

def test_normal_pdf():
  normal = Normal(0.0, 1.0)
  assert_almost_equal(normal.pdf(1.0), 0.2419707)
  assert_almost_equal(normal.pdf(-1.0), 0.2419707)

def test_normal_cdf():
  normal = Normal(0.0, 1.0)
  assert_almost_equal(normal.cdf(0.0), 0.5)
  assert_almost_equal(normal.cdf(-5.326724), 5e-8)
  assert_equal(normal.cdf(1.0), 1 - normal.ccdf(1.0))