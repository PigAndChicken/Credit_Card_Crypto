module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    check_digit = nums_a.pop

    checksum =  nums_a.reverse.each_with_index.inject(0) do |result, val|
      index = val.last + 2
      temp = ( (index%2) == 0) ? val.first * 2 : val.first
      temp = (temp >= 10 ) ? ((temp/10)+(temp%10)) : temp
      result = result + temp
    end

    ( 10 - checksum%10 ) == check_digit
    # TODO: use the integers in nums_a to validate its last check digit
  end
end
