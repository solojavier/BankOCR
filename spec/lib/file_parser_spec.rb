require 'bankocr'

describe BankOCR::FileParser do

  let(:input_path) { File.dirname(__FILE__) + '/user_story_1.in'  }

  context 'when parsing a file' do

    let(:account_numbers) do
      %w(000000000 111111111 222222222 333333333 444444444 555555555 666666666
         777777777 888888888 999999999 123456789 12345678?)
    end

    it 'returns an array with account numbers' do
      parser = described_class.new(input_path)

      expect(parser.entries.map(&:to_s)).to eq(account_numbers)
    end

    it 'returns empty account_numbers if error reading file' do
      parser = described_class.new('invalid_path')

      expect(parser.entries).to eq([])
    end

  end

end
