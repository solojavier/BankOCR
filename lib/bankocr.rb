require 'bankocr/version'

# Module with logic to process a OCR input file
# and export a report with account numbers
module BankOCR
  autoload :FileParser,      'file_parser'
  autoload :AccountNumber,   'account_number'
  autoload :ReportGenerator, 'report_generator'

  def self.process(input, output)
    account_numbers = BankOCR::FileParser.new(input).entries

    BankOCR::ReportGenerator.new(output, account_numbers).save!
  end
end
