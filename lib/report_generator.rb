module BankOCR
  # Creates a text file with generated report
  class ReportGenerator
    def initialize(output_path, account_numbers)
      @output_path     = output_path
      @account_numbers = account_numbers
    end

    def save!
      file = File.open(@output_path, 'w+')

      @account_numbers.each do |account|
        file.write "#{account}#{error(account)}\n"
      end

      file.close
    end

    private

    def error(account)
      if account.to_s.include?('?')
        ' ILL'
      elsif !account.valid?
        ' ERR'
      end
    end

  end
end
