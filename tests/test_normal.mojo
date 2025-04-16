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

def test_normal_quantile():
  normal = Normal(0.0, 1.0)
  assert_equal(normal.quantile(0.5), 0)
  assert_almost_equal(normal.quantile(0.05), -1.644854, atol = 1e-6)
  assert_almost_equal(normal.quantile(5e-8), -5.326724, atol = 1e-6)

def test_normal_add():
  normal = Normal(0.0, 1.0)
  normal1 = normal + 1.0
  assert_equal(normal1.mu, 1.0)
  normal2 = 2.0 + normal
  assert_equal(normal2.mu, 2.0)

def test_normal_sub():
  normal = Normal(0.0, 1.0)
  normal1 = normal - 1.0
  assert_equal(normal1.mu, -1.0)
  normal2 = 2.0 - normal
  assert_equal(normal2.mu, 2.0)

def test_normal_mul():
  normal = Normal(5.0, 2.0)
  normal10 = normal * 2.0
  assert_equal(normal10.mu, 10.0)
  assert_equal(normal10.sigma, 4.0)