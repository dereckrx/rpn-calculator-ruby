=begin

This class creates the hash of operations available to the calculator.
It knows where the operation files are located, but leaves the
loading and constatizing of those classes to the 'ClassLoader' class. 

==Example

  loader = OperationLoader.new
  loader.operations # => { '+' => AddOperation.new, '-' => SubtractOperation.new }
  
=end

Dir['./lib/operations/*_operation.rb'].each {|file| require file }
require_relative 'class_loader'

class OperationLoader
  
  OPERATIONS_PATH  = './lib/operations/*_operation.rb'
  
  # Returns hash of operator keys and their operations.
  def operations
    operation_classes.each_with_object({}) do |operation, hash|
      hash[operation.key] = operation.new
    end
  end
  
  private
  
  def operation_classes
    class_loader.classify_files(OPERATIONS_PATH)
  end
  
  def class_loader
    @class_loader ||= ClassLoader.new
  end
  
end