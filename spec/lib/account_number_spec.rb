require 'bankocr'

describe BankOCR::AccountNumber do

  def digits(string)
    string.split('').map do |c|
      shape = BankOCR::Digit::CONVERSIONS.keys[c.to_i]
      BankOCR::Digit.new(shape)
    end
  end

  context 'when validating account numbers' do

    let(:valid_numbers)   { %w(711111111b 123456789 490867715) }
    let(:invalid_numbers) { %w(888888888 490067715 012345678) }

    it 'validates valid account numbers' do
      valid_numbers.each do |n|
        account = described_class.new(digits(n))

        expect(account.valid?).to eq(true)
      end
    end

    it 'validates invalid account numbers' do
      invalid_numbers.each do |n|
        account = described_class.new(digits(n))

        expect(account.valid?).to eq(false)
      end
    end

  end

end
