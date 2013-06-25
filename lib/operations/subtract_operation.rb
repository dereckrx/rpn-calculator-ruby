require_relative 'operation'

class SubtractOperation < Operation
  
  KEY = '-'
  
  def call(x, y)
    x - y
  end
  
end