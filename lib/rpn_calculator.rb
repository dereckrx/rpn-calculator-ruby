=begin 

This class iterates through a tokenized calculator expression and:

 * if it's a value, pushes it on the stack
 * if it's an operator, evalutates it and pushes its result on the stack
 * else raises an invalid token error

So if the input tokens are ['1', '2', '+', '4', '*']:

 * 1 would push 1 onto the stack.
 * 2 would then push 2 onto the stack (so the stack is now [1,2] with 3 on top)
 * + would remove the top two stack entries from the stack (1 and 2),
   add them together and put the result on the stack. So the stack would now be [3].
 * 4 would push 4 onto the stack [3,4]
 * '*' would pop the top two entries and mulitply them together, and push 12 onto the stack.
 * When no tokens are left, the last value on the stack [12] is returned as the result.

== Example
  
  calculator = RpnCalculator.new
  calculator.evaluate(['1', '2', '+', '4', '*'])  # => 12

=end 

require_relative 'operation_bank'
require_relative 'rpn_stack'
require_relative 'rpn_error'

class RpnCalculator

  # Returns the number that results from evaluating the tokenized epression.
  def evaluate(tokens)
    stack.reset
    
    tokens.each do |token|
      if is_operator?(token)
        stack.push(evaluate_operator(token))
      elsif is_value?(token)
        stack.push(token.to_f)
      else
        raise RpnError, "Invalid token '#{token}'." 
      end
    end
    
    stack.pop_result
  end
  
  private
  
  def stack
    @stack ||= RpnStack.new
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
    y, x = stack.pop_pair
    operation_bank.call(operator, x, y)
  end
  
end