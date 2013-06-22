require_relative 'operation'

class SubtractOperation < Operation
  
  KEY = '-'
  
  def call(x, y)
    y - x
  end
  
end