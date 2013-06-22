# Inherit from StandardError not Exception
# since this exception deals with application 
# level errors, not enviornment level errors.

class RpnError < StandardError 
end