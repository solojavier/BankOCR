require "bankocr/version"

module BankOCR
  autoload :FileParser,      'file_parser'
  autoload :AccountNumber,   'account_number'
  autoload :ReportGenerator, 'report_generator'

  def self.process(input, output)
    digit_strings   = BankOCR::FileParser.new(input).entries
    account_numbers = digit_strings.map { |d| BankOCR::AccountNumber.new(d) }

    BankOCR::ReportGenerator.new(output, account_numbers).save!
  end
end
