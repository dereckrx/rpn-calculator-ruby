Dir["./lib/operations/*_operation.rb"].each {|file| require file }

class OperationFactory

  def initialize
    @operations = init_operations
  end
  
  def call(key)
    @operations[key]
  end
  
  def keys
    @keys ||= @operations.keys
  end
  
  def include?(key)
    keys.include?(key)
  end
  
  def init_operations
    Dir["./lib/operations/*_operation.rb"].each_with_object({}) do |file, hash| 
      class_name = file[/[^\/]+_operation/]
      klass = string_to_class(class_name)
      hash[klass.key] = klass.new
    end
  end
  
  def string_to_class(string)
    klass = string.split('_').map{|e| e.capitalize}.join
    Object.const_get(klass)
  end
  
end