require 'minitest/autorun'
require_relative '../lib/class_loader.rb'

# Setup fake operation for testing
FakeOperation = Struct.new('FakeOperation')

class TestClassLoader < MiniTest::Unit::TestCase
  
  def setup
    @class_loader = ClassLoader.new
  end
  
  def test_classify
    klass = @class_loader.classify("FakeOperation")
    assert_equal FakeOperation, klass
  end
  
  def test_classify_snake_case
    klass = @class_loader.classify("fake_operation")
    assert_equal FakeOperation, klass
  end
  
  def test_classify_file
    klass = @class_loader.classify_file("../lib/operations/fake_operation.rb")
    assert_equal FakeOperation, klass
  end
  
  def test_classify_files
    
    # Override so test doesn't rely on file system.
    def @class_loader.paths_for(path_pattern)
      ["../lib/operations/fake_operation.rb"]
    end
    classes = @class_loader.classify_files("./lib/operations/*_operation.rb")
    
    assert_includes classes, FakeOperation
  end
  
end