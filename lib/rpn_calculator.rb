=begin 

This class iterates through a tokenized expression and:

 * if it's a value, pushes it on the stack
 * if it's an operator, evalutates it and pushes its result on the stack
 * else raises an invalid token error
 
Single values can be pushed on the stack, but only value pairs can be popped. 
An RPN expression is valid only if one value remains on the stack after all 
the operators have been evaluated. 

The calculator will raise errors if the number of 
remaining values is incorrect for #pop_pair or #pop_result

So if the input tokens are ['1', '2', '+', '4', '*']:

 * Push 1 onto the stack.
 
 * Push 2 onto the stack. So the stack is now [1,2] with 3 on top)
 
 * '+' pop the top two stack entries from the stack (1 and 2), add them 
   together and put the result (3) on the stack. So the stack would now be 
   [3].
   
 * Push 4 onto the stack. So the stack  is now [3,4].
 
 * '*' pop the top two entries and mulitply them together, and push 12 
   onto the stack. The stack is now [12].
 
 * When no tokens are left, the last value on the stack (12) is returned as 
   the result.

== Example
  
  calculator = RpnCalculator.new
  calculator.evaluate(['1', '2', '+', '4', '*'])  # => 12

=end 

require_relative 'operation_bank'
require_relative 'rpn_error'

class RpnCalculator

  # Returns the number that results from evaluating the tokenized epression.
  def evaluate(tokens)
    reset
    
    tokens.each do |token|
      if is_operator?(token)
        push(evaluate_operator(token))
      elsif is_value?(token)
        push(token.to_f)
      else
        raise RpnError, "Invalid token '#{token}'." 
      end
    end
    
    pop_result
  end
  
  private
  
  def reset
    @stack = []
  end
  
  def push(value)
    @stack.push(value)
  end
  
  def operation_bank
    @operation_bank ||= OperationBank.new
  end
  
  def is_operator?(token)
    operation_bank.include?(token)
  end
  
  def is_value?(token)
    token.match(/\d+/)
  end
  
  def evaluate_operator(operator)
    y, x = pop_pair
    operation_bank.call(operator, x, y)
  end

  def pop_pair
    raise RpnError, "Not enough values." if @stack.length < 2
    [@stack.pop, @stack.pop]
  end

  def pop_result
    raise RpnError, "Not enough operators." if @stack.length > 1
    @stack.pop
  end

end