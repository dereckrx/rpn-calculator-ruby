require_relative 'operation_factory'
require_relative 'rpn_error'

class RpnCalculator
  
  def call(tokens)
    @values = []
    
    tokens.each do |t|
      if is_operator?(t)
        @values << process_operator(t)
      elsif is_value?(t)
        @values << t.to_f
      else
        raise RpnError, "Invalid token '#{t}'." 
      end
    end
    
    result
  end
  
  private
  
  def is_operator?(token)
    operation_factory.include?(token)
  end
  
  def is_value?(token)
    token.match(/\d+/)
  end
  
  def process_operator(token)
    operation = operation_factory.call(token)
    x, y = next_pair
    operation.call(x, y)
  end
  
  def next_pair
    if @values.length > 1
      [@values.pop, @values.pop]
    else
      raise RpnError, "Not enough values."
    end
  end
  
  def result
    if @values.length == 1
      @values.pop
    else
      raise RpnError, "Not enough operators."
    end
  end
  
  def operation_factory
    @operation_factory ||= OperationFactory.new
  end
  
end