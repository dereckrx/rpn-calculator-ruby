=begin

This class manages the stack for the calculator. 
Single values can be pushed, but only value pairs 
can be popped. Only if one value remains in the stack
can a single value be popped.

The stack will raise errors if the number of 
remaining values is incorrect for #pop_pair or #pop_result

== Example

  stack = RpnStack.new
  stack.push(1)     # => [1]
  stack.pop_pair    # => Error
  stack.push(2)     # => [1,2]
  stack.pop_result  # => Error
  stack.pop_pair    # => [2,1] # Stack is now empty
  stack.push(3)     # => [3]
  stack.pop_result  # => 3

=end

require_relative 'rpn_error'

class RpnStack
  
  def initialize
    reset
  end
  
  # Clear the values in the stack
  def reset
    @values = []
  end
  
  # Push _value_ onto the stack
  def push(value)
    @values.push(value)
  end
  
  # Returns the top two values on stack. 
  # Raises an error if there's not enough values on the stack.
  def pop_pair
    raise RpnError, "Not enough values." if @values.length < 2
    [pop, pop]
  end
  
  # Returns last value on the stack.
  # Raises an error if more than one value remains on the stack.
  def pop_result
    raise RpnError, "Not enough operators." if @values.length > 1
    pop
  end
  
  private 
  
  def pop
    @values.pop
  end
  
end