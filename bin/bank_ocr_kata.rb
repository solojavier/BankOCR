require_relative '../lib/utils'

INPUT  = File.dirname(__FILE__) + '/input/ocr_input.in'
OUTPUT = File.dirname(__FILE__) + '/output/ocr_accounts_report.out'

include BankOCR::Utils

generate_report(OUTPUT, validate_accounts(parse_file(INPUT)))
p "OCR accounts report generated succesfully"
