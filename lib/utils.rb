module BankOCR
  module Utils

    # Parses an OCR machine input file and returns an array of account numbers
    def parse_file(input_path)
      file    = File.open(input_path)
      numbers = []

      while !file.eof?
        numbers << next_entry_to_digits(file)
      end
      numbers
    ensure
      file.close
    end

    def validate_accounts(account_numbers)
    end

    private

    def next_entry_to_digits(file)
      top    = file.readline
      middle = file.readline
      bottom = file.readline
      _blank = file.readline

      (0..8).map do |i|
        low   = (i * 3)
        high  = ((i + 1) * 3) - 1
        shape = top[low..high] + middle[low..high] + bottom[low..high]

        conversions[shape]
      end.join
    end

    def conversions
      {
        " _ | ||_|" => "0",
        "     |  |" => "1",
        " _  _||_ " => "2",
        " _  _| _|" => "3",
        "   |_|  |" => "4",
        " _ |_  _|" => "5",
        " _ |_ |_|" => "6",
        " _   |  |" => "7",
        " _ |_||_|" => "8",
        " _ |_| _|" => "9"
      }
    end

  end
end
