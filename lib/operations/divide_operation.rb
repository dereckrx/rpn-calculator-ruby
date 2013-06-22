require_relative 'operation'

class DivideOperation < Operation
  
  KEY = '/'
  
  def call(x, y)
    y / x
  end
  
end