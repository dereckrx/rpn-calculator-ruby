require_relative 'operation'

class AddOperation < Operation
  
  KEY = '+'
  
  def call(x, y)
    x + y
  end
  
end