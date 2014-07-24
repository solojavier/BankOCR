module BankOCR
  # Reads a file from OCR and converts to digits
  class FileParser
    def initialize(input_path)
      @input_path = input_path
    end

    def entries
      @digits || read_entries
    end

    def read_entries
      @digits = []
      file     = File.open(@input_path)
      @digits << parse_entry(file) until file.eof?

      @digits.map { |d| BankOCR::AccountNumber.new(d) }
    rescue
      p 'Error reading input file, please validate'
      []
    ensure
      file.close if file
    end

    private

    def parse_entry(file)
      top    = file.readline
      middle = file.readline
      bottom = file.readline
      _blank = file.readline

      build_digit(top, middle, bottom)
    end

    def build_digit(top, middle, bottom)
      (0..8).map do |i|
        low   = (i * 3)
        high  = ((i + 1) * 3) - 1
        shape = top[low..high] + middle[low..high] + bottom[low..high]

        BankOCR::Digit.new(shape)
      end
    end
  end
end
