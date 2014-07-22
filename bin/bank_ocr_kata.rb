require_relative '../application'

INPUT  = File.dirname(__FILE__) + '/input/ocr_input.in'
OUTPUT = File.dirname(__FILE__) + '/output/ocr_accounts_report.out'

BankOCR::Application.new(INPUT, OUTPUT).run
p "OCR accounts report generated succesfully"
