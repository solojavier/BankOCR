require_relative 'lib/utils'

module BankOCR
  class Application

    include BankOCR::Utils

    def initialize(input_path, output_path)
      @input  = input_path
      @output = output_path
    end

    def run
      generate_report(@output, validate_accounts(parse_file(@input)))
    end

  end
end
