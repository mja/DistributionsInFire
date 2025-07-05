from distributions import *
from math import erf
from testing.testing import (
    assert_true,
    assert_almost_equal,
    assert_equal,
    assert_not_equal,
    assert_raises,
)

def test_erf_neg():
  assert_equal(erf(Float64(1)), -erf(Float64(-1)), msg = "erf(1) and -erf(-1) should be equal")

def test_erf_table_small():
  assert_almost_equal(erf(0.02),	0.022564575)
  assert_almost_equal(erf(1.0),	0.842700793)
  assert_almost_equal(erf(2.0), 0.995322265)
  assert_almost_equal(erf(-0.02),	-0.022564575)
  assert_almost_equal(erf(-1.0),	-0.842700793)
  assert_almost_equal(erf(-2.0), -0.995322265)


def test_erf_table_large():
  assert_almost_equal(erf(2.5), 0.999593048)
  assert_almost_equal(erf(-2.5), -0.999593048)

def test_erf_table_very_large():
  assert_almost_equal(erf(3.5), 0.999999257)
  assert_almost_equal(erf(-3.5), -0.999999257)

def test_erf_taylor():
  assert_equal(erf_taylor[1](1), -erf_taylor[1](-1))
  assert_equal(erf_taylor[10](1), -erf_taylor[10](-1))
  assert_not_equal(erf_taylor[1](1), erf_taylor[21](1))
  assert_almost_equal(erf_taylor[20](1), erf_taylor[21](1))

def test_erfc_dia():
  assert_equal(erfc_dia(1), erfc_dia(1))
  assert_almost_equal(1 - erfc_dia(1), -(1 - erfc_dia(-1)))
  assert_almost_equal(erfc_dia(1), 0.1572992)

def test_erf_dia():
  assert_equal(erf_dia(1), erf_dia(1))
  assert_almost_equal(erf_dia(1), -erf_dia(-1))
  assert_almost_equal(erf_dia(1), 0.8427008)
  assert_equal(erf_dia(1), 1 - erfc_dia(1))

def test_erfinv():
  assert_equal(erfinv(0), 0)
  assert_almost_equal(erfinv(0.5), 0.4769363, atol = 3.5e-4)
  assert_almost_equal(erfinv(-0.5), -0.4769363, atol = 3.5e-4)
  assert_almost_equal(erfinv(0.5), -erfinv(-0.5), atol = 3.5e-4)
