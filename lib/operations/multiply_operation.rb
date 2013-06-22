require_relative 'operation'

class MultiplyOperation < Operation
  
  KEY = '*'
  
  def call(x, y)
    x * y
  end
  
end