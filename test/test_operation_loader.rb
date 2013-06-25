require 'minitest/autorun'
require_relative '../lib/operation_loader.rb'

class TestOperationLoader< MiniTest::Unit::TestCase
  
  # Mock Tee Operation class for testing
  TeeOperation = Struct.new('TeeOperation') do 
    def self.key
      'T'
    end
  end
  
  def setup
  
    @loader = OperationLoader.new
    
    # Override the operation method to remove 
    # dependancy on ClassLoader so we can test
    # this class in isolation.
    def @loader.operation_classes
      [TeeOperation]
    end
    
  end
  
  def test_call
    result = @loader.operations
    key = 'T'
    value = TeeOperation
    
    assert_equal key, result.keys.first
    assert_equal value, result[key].class
  end
  
end