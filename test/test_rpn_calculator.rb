require "minitest/autorun"
require_relative "../lib/rpn_calculator.rb"

class TestRpnCalculator < MiniTest::Unit::TestCase
  
  def setup
    @calc = RpnCalculator.new
  end
  
  def test_add
    input = %w{ 4 3 + }
    result = @calc.call(input)
    
    assert_equal 7, result
  end
  
  def test_minus
    input = %w{ 4 3 - }
    result = @calc.call(input)
    
    assert_equal 1, result
  end
  
  def test_multiply
    input = %w{ 4 3 * }
    result = @calc.call(input)
    
    assert_equal 12, result
  end
  
  def test_divide
    input = %w{ 8 2 / }
    result = @calc.call(input)
    
    assert_equal 4, result
  end
  
  def test_two_operations
    input = %w{ 1 2 + 4 * }
    result = @calc.call(input)
    
    assert_equal 12, result
  end
  
  def test_four_operations
    input = %w{ 5 1 2 + 4 * + 3 - }
    result = @calc.call(input)
    
    assert_equal 14, result
  end
  
  def test_not_enough_operators
    assert_raises RpnError do
      @calc.call( %w{ 1 2 } )
    end
  end
  
  def test_not_enough_values
    assert_raises RpnError do
      @calc.call( %w{ 1 + } )
    end
  end
  
  def test_invalid_token
    assert_raises RpnError do
      @calc.call( %w{ 1 a + } )
    end
  end
end