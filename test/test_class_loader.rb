require 'minitest/autorun'
require_relative '../lib/class_loader.rb'

# Setup mock squeeze (>_<) operation for testing
SqueezeOperation = Struct.new('SqueezeOperation')

class TestClassLoader < MiniTest::Unit::TestCase
  
  def setup
    @class_loader = ClassLoader.new
  end
  
  def test_classify
    klass = @class_loader.classify("SqueezeOperation")
    assert_equal SqueezeOperation, klass
  end
  
  def test_classify_snake_case
    klass = @class_loader.classify("squeeze_operation")
    assert_equal SqueezeOperation, klass
  end
  
  def test_classify_file
    klass = @class_loader.classify_file("../lib/operations/squeeze_operation.rb")
    assert_equal SqueezeOperation, klass
  end
  
  def test_classify_files
    
    # Override so test doesn't rely on file system.
    def @class_loader.paths_for(path_pattern)
      ["../lib/operations/squeeze_operation.rb"]
    end
    classes = @class_loader.classify_files("./lib/operations/*_operation.rb")
    
    assert_includes classes, SqueezeOperation
  end
  
end