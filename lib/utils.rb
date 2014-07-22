# Module for BankOCR Application
module BankOCR
  # Utility functions to perform data conversions
  module Utils
    # Parses an OCR machine input file and returns an array of account numbers
    def parse_file(input_path)
      file    = File.open(input_path)
      numbers = []

      numbers << next_entry_to_digits(file) until file.eof?
      numbers
    rescue
      []
    ensure
      file.close if file
    end

    # Receives a list of account numbers and returns validation information
    def validate_accounts(account_numbers)
      account_numbers.map do |number|
        valid, message = validate(number.to_s)

        { account_number: number, valid: valid, message: message }
      end
    end

    # Creates a file report in ouput path with accounts received
    def generate_report(output_path, accounts)
      file = File.open(output_path, 'w+')

      accounts.select { |a| a[:account_number] }.each do |acc|
        file.write acc[:account_number]
        file.write " #{acc[:message]}" if !acc[:valid] && acc[:message]
        file.write "\n"
      end

      file.close
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

    def sum(account_number)
      (0..8).map { |i| account_number[i].to_i * (i + 2) }.reduce(:+)
    end

    def validate(number)
      if number.include?('?')
        [false, 'ILL']
      elsif sum(number) % 11 != 0
        [false, 'ERR']
      else
        [true, 'OK']
      end
    end
  end
end
