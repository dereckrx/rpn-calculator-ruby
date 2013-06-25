require 'minitest/autorun'
require_relative '../lib/operation_bank.rb'

class TestOperationBank < MiniTest::Unit::TestCase
  
  # Setup mock squeeze (>_<) operation for testing
  SqueezeOperation = Struct.new('SqueezeOperation') do 
    def call(x, y)
      12
    end
  end
  
  def setup
    @bank = OperationBank.new
    
    # Inject Dependancy by stubbing the _operations_ method
    def @bank.operations
      { '>_<' => SqueezeOperation.new }
    end
  end
  
  def test_included_operation
    assert @bank.include?('>_<')
  end
  
  def test_unincluded_operation
    refute @bank.include?('%')
  end
  
  def test_call_operation
    assert_equal 12, @bank.call('>_<', 1, 2)
  end
  
end
