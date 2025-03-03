# frozen_string_literal: true

# Validates credit card number using Luhn Algorithm
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit

    # step 1: drop the check digit (last digit) of the number to validation
    check_digit = nums_a.pop

    # step 2: calculate the check digit
    sum = 0
    nums_a.reverse.each_with_index do |digit, index|
      # double every two digit (index=0,2,4,6...)
      digit *= 2 if index.even?

      # if doubled result > 9, subtract 9
      digit -= 9 if digit > 9

      # Add result to the sum
      sum += digit
    end

    # return validation
    ((sum + check_digit) % 10).zero?
  end
end
