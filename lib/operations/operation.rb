=begin
This is the superclass of all 'Operation' classes. All subclasses must define
the 'KEY' constant, which is used to identifiy the operation, 
and the 'call' method, which evaluates the operation. 

These operations are generic and could be used in a 
different type of calculator.
=end

class Operation

  # String identifier of the operator.
  KEY = nil 
  
  # Evaluate the operation.
  def call(x,y)
    raise "Operation not implemented."
  end
  
  def self.key
    self::KEY
  end
  
end