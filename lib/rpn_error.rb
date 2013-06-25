=begin

Standard error class for RPN errors.

Inherit from StandardError not Exception
since this exception deals with application 
level errors, not enviornment level errors.

=end

class RpnError < StandardError 
end