require 'minitest/autorun'
require_relative '../lib/rpn_stack.rb'

class TestRpnStack < MiniTest::Unit::TestCase
  
  def setup
    @stack = RpnStack.new
  end
  
  def test_pop_pair
    @stack.push(1)
    @stack.push(2)
    
    assert_equal [2,1], @stack.pop_pair
  end
  
  def test_error_when_pop_pair_called_with_one_item
    @stack.push(1)
    
    assert_raises RpnError do
      @stack.pop_pair
    end
  end
  
  def test_pop_result
    @stack.push(1)
    
    assert_equal 1, @stack.pop_result
  end
  
  def test_error_when_pop_result_called_with_two_items
    @stack.push(1)
    @stack.push(2)
    
    assert_raises RpnError do
      @stack.pop_result
    end
  end
  
end