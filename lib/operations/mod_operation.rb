require_relative 'operation'

class ModOperation < Operation
  
  KEY = '%'
  
  def call(x, y)
    x % y
  end
  
end