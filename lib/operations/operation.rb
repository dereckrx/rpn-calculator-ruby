class Operation

  KEY = nil
  
  def to_s
    self.class::KEY
  end
  
  def self.key
    self::KEY
  end
  
end