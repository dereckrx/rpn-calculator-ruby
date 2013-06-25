Dir['./lib/operations/*_operation.rb'].each {|file| require file }
require 'minitest/autorun'


class TestOperations < MiniTest::Unit::TestCase
  
  def test_add
    operation = AddOperation.new
    assert AddOperation.key
    assert_equal 6, operation.call(4, 2)
  end
  
  def test_subtract
    operation = SubtractOperation.new
    assert SubtractOperation.key
    assert_equal 1, operation.call(3, 2)
  end
  
  def test_multiply
    operation = MultiplyOperation.new
    assert MultiplyOperation.key
    assert_equal 8, operation.call(4, 2)
  end
  
  def test_divide
    operation = DivideOperation.new
    assert DivideOperation.key
    assert_equal 3, operation.call(6, 2)
  end
  
  def test_mod
    operation = ModOperation.new
    assert ModOperation.key
    assert_equal 0, operation.call(4, 2)
    assert_equal 1, operation.call(4, 3)
  end
  
end