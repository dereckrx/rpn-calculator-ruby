require_relative 'operation'

class ModOperation < Operation
  
  KEY = '%'
  
  def call(x, y)
    y % x
  end
  
end