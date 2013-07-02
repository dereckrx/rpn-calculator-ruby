=begin

This class holds the operations available to the calculator
and manages calling the operations. Operations are called 
using their 'operator' key. 

== Example

  bank = OperationBank.new
  bank.include?('+')   # => true
  bank.call('+', 2, 1) # => 3

=end

require_relative 'operation_loader'

class OperationBank
  
  # Returns the value of calling the operation on _x_ and _y_
  def call(operator, x, y)
    operations.fetch(operator).call(x, y)
  end
  
  # Returns true if the operation represented by _operator_ is supported. 
  def include?(operator)
    operators.include?(operator)
  end
  
  private
  
  def operators
    @operators ||= operations.keys
  end
  
  def operations
    @operations ||= OperationLoader.new.operations
  end
  
end