module BankOCR
  # Object representing an account number
  class AccountNumber

    def initialize(digits)
      @digits = digits
    end

    def valid?
      @valid ||= sum(to_s) % 11 == 0
    end

    def to_s
      @digits.map(&:value).join
    end

    private

    def sum(account_number)
      (0..8).map { |i| account_number[i].to_i * (i + 2) }.reduce(:+)
    end
  end
end
