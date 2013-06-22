#!/usr/bin/env ruby

require_relative 'rpn_calculator'
require_relative 'rpn_error'

class CommandLineRunner
  
  def run    
    input = nil
    
    while true
      begin
        print "> "
        input = gets.chomp
      
        break if input == 'exit'
      
        tokens = input.split(' ')
        puts calculator.call(tokens)
        
      rescue error => e
        puts e.message
      end
    end
  end
  
  def calculator
    @calculator ||= RpnCalculator.new
  end
  
  def error
    @error ||= RpnError
  end
  
end

Runner.new.run