module BankOCR
  class AccountNumber

    attr_reader :error_message

    def initialize(digits)
      @digits = digits
      @valid  = false

      validate!
    end

    def valid?
      @valid
    end

    def validate!
      @error_message =   'ILL' if @digits.include?('?')
      @error_message ||= 'ERR' if sum(@digits) % 11 != 0

      @valid = true unless @error_message
    end

    private

    def sum(account_number)
      (0..8).map { |i| account_number[i].to_i * (i + 2) }.reduce(:+)
    end

  end
end
