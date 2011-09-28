class Message
  
  LOWER_CASE = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
  UPPER_SINGLE = ["Z"]
  UPPER_MULTIPLE = ["M", "K", "P", "Q"]
  
  attr_accessor :value
  
  def initialize
    value = ""
  end
  
  def is_valid?
    characters = value.split(//)
    msg1 = ""
    msg2 = ""
    
    while symbol = characters.pop
      if LOWER_CASE.include?(symbol)
        if msg1.empty?
          msg1 = symbol
        elsif msg2.empty?
          msg2 = symbol
        else
          return false
        end  
      elsif UPPER_SINGLE.include?(symbol)
        if msg1.empty? && msg2.empty?
          return false
        else
          if msg2.empty?
            msg1 = symbol + msg1
          else
            msg2 = symbol + msg2
          end
        end
      else UPPER_MULTIPLE.include?(symbol)
        if msg1.empty? || msg2.empty?
          return false
        else
          msg1 = symbol + msg1 + msg2
          msg2 = ""
        end
      end
    end
    
    # only one message should be remaining in the end
    if !msg2.empty?
      return false
    else
      return true
    end
  end
  
end