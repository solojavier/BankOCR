require 'bankocr'

describe BankOCR::AccountNumber do

  context 'when validating account numbers' do

    let(:valid_numbers)   { %w(711111111b 123456789 490867715) }
    let(:invalid_numbers) { %w(888888888 490067715 012345678) }
    let(:wrong_numbers)   { %w(86110?356) }

    let(:wrong_accounts) do
      [ { account_number: '86110??36', valid: false, message: 'ILL' } ]
    end

    it 'validates valid account numbers' do
      valid_numbers.each do |n|
        account = described_class.new(n)

        expect(account.valid?).to eq(true)
        expect(account.error_message).to eq(nil)
      end
    end

    it 'validates invalid account numbers' do
      invalid_numbers.each do |n|
        account = described_class.new(n)

        expect(account.valid?).to eq(false)
        expect(account.error_message).to eq('ERR')
      end
    end

    it 'validates wrong account numbers' do
      wrong_numbers.each do |n|
        account = described_class.new(n)

        expect(account.valid?).to eq(false)
        expect(account.error_message).to eq('ILL')
      end
    end

  end

end
