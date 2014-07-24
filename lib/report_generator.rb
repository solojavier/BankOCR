module BankOCR
  class ReportGenerator

    def initialize(output_path, account_numbers)
      @output_path     = output_path
      @account_numbers = account_numbers
    end

    def save!
      file = File.open(@output_path, 'w+')

      @account_numbers.each do |account|
        file.write account.digits
        file.write " #{account.error_message}" if !account.valid?
        file.write "\n"
      end

      file.close
    end

  end
end
