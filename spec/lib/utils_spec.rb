require 'rspec'
require_relative '../../lib/utils'

describe BankOCR::Utils do

  subject { Object.new.extend(described_class) }

  context 'when parsing a file' do

    let(:input_path) { File.dirname(__FILE__) + '/user_story_1.in'  }
    let(:account_numbers) do
      [
        "000000000", "111111111", "222222222", "333333333",
        "444444444", "555555555", "666666666", "777777777",
        "888888888", "999999999", "123456789"
       ]
    end

    it 'returns an array with account numbers' do
      expect(subject.parse_file(input_path)).to eq(account_numbers)
    end
  end

  context 'when validating account numbers' do

    let(:valid_numbers)   { [ "711111111b", "123456789", "490867715" ] }
    let(:invalid_numbers) { [ "888888888", "490067715", "012345678"] }

    let(:valid_accounts) do
      [
        { account_number: "711111111b", valid: true },
        { account_number: "123456789",  valid: true },
        { account_number: "490867715",  valid: true }
      ]
    end

    let(:invalid_accounts) do
      [
        { account_number: "888888888", valid: false },
        { account_number: "490067715", valid: false },
        { account_number: "012345678", valid: false }
      ]
    end

    it 'validates valid account numbers' do
      expect(subject.validate_accounts(valid_numbers)).to eq(valid_accounts)
    end

    it 'validates invalid account numbers' do
      expect(subject.validate_accounts(invalid_numbers)).to eq(invalid_accounts)
    end

  end

end
