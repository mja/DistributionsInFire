from distributions import *
from distributions.continuous.chisq import *
from testing.testing import (
    assert_true,
    assert_almost_equal,
    assert_equal,
    assert_not_equal,
    assert_raises,
    assert_is
)

def test_chisq_create():
  chisq = ChiSq(1)
  assert_equal(chisq.k, 1)

def test_chisq_pdf():
  chisq = ChiSq(1.0)
  assert_almost_equal(chisq.pdf(1.0), 0.2419707)
  assert_almost_equal(chisq.pdf(2.0), 0.1037769)
  assert_almost_equal(chisq.pdf(10.0), 0.0008500367)
  assert_almost_equal(chisq.pdf(0), 0.0)
  assert_almost_equal(chisq.pdf(-1), 0.0)
  