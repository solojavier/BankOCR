module BankOCR
  # Reads a file from OCR and converts to digits
  class FileParser
    def initialize(input_path)
      @input_path = input_path
    end

    def entries
      @entries || read_entries
    end

    def read_entries
      @entries = []
      file     = File.open(@input_path)
      @entries << parse_entry(file) until file.eof?

      @entries
    rescue
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

      entry_to_digits(top, middle, bottom)
    end

    def entry_to_digits(top, middle, bottom)
      (0..8).map do |i|
        low   = (i * 3)
        high  = ((i + 1) * 3) - 1
        shape = top[low..high] + middle[low..high] + bottom[low..high]

        conversions[shape] || '?'
      end.join
    end

    def conversions
      { ' _ | ||_|' => '0',
        '     |  |' => '1',
        ' _  _||_ ' => '2',
        ' _  _| _|' => '3',
        '   |_|  |' => '4',
        ' _ |_  _|' => '5',
        ' _ |_ |_|' => '6',
        ' _   |  |' => '7',
        ' _ |_||_|' => '8',
        ' _ |_| _|' => '9' }
    end
  end
end
