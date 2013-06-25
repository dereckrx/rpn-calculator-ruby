=begin

This class converts strings and file paths into class constants. 

=end

class ClassLoader
  
  # Returns the class constant represented by _string_.
  def classify(string)
    Object.const_get( camel_case(string) )
  end
  
  # Returns the class constant represtend by the .rb file in _path_.
  def classify_file(path)
    classify(File.basename(path, ".rb"))
  end
  
  # Returns an array of class constants who's file path matches _path_pattern_.
  def classify_files(path_pattern)
    paths_for(path_pattern).each_with_object([]) do |path, classes|
      classes << classify_file(path)
    end
  end
  
  private
  
  def paths_for(path_pattern)
    Dir.glob(path_pattern)
  end
  
  def camel_case(string)
    if string.match('_')
      string.split('_').map{|e| e.capitalize}.join
    else
      string
    end
  end
  
end