#!/usr/bin/env ruby

=begin

This is the command line interface for the RPN calculator.

=end

require_relative 'rpn_calculator'
require_relative 'rpn_error'

class CommandLineRunner
  
  # Evaluates RPN input until 'exit' is entered. 
  def run    
    input = nil
    
    while true
      begin
        print "> "
        input = sanitize(gets)
      
        break if input == 'exit'
      
        tokens = input.split(' ')
        puts calculator.evaluate(tokens)
        
      rescue error => e
        puts e.message
      end
    end
  end
  
  private
  
  def sanitize(input)
    input.chomp.downcase.strip
  end
  
  def calculator
    @calculator ||= RpnCalculator.new
  end
  
  def error
    @error ||= RpnError
  end
  
end

CommandLineRunner.new.run