module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # TODO: use the integers in nums_a to validate its last check digit
    non_checked_nums = nums_a[0...(nums_a.length-1)]
    idx = 0
    doubled_num = non_checked_nums.map { |num|
      idx += 1
      idx.even? ? num*2 : num
    }
    sum_digits = doubled_num.map { |num|
      digits = num.to_s.chars.map(&:to_i)
      digits.reduce(&:+)
    }.reduce(&:+)
    sum_a = sum_digits.to_s.chars.map(&:to_i)
    check_digit = 10 - sum_a[sum_a.length-1]
    nums_a[nums_a.length-1]==check_digit ? true : false
  end
end
