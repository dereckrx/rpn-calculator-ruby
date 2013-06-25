require_relative 'operation'

class DivideOperation < Operation
  
  KEY = '/'
  
  def call(x, y)
    x / y
  end
  
end