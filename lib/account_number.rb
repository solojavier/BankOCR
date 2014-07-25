module BankOCR
  # Object representing an account number
  class AccountNumber
    def initialize(digits)
      @digits = digits
    end

    def valid?
      @valid ||= sum % 11 == 0
    end

    def to_s
      @digits.map(&:value).join
    end

    private

    def sum
      (0..8).map { |i| to_s[i].to_i * (i + 2) }.reduce(:+)
    end
  end
end
