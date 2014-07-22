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
        "888888888", "999999999", "123456789", "12345678?"
       ]
    end

    it 'returns an array with account numbers' do
      expect(subject.parse_file(input_path)).to eq(account_numbers)
    end

    it 'returns empty account_numbers if error reading file' do
      expect(subject.parse_file('invalid_path')).to eq([])
    end

  end

  context 'when validating account numbers' do

    let(:valid_numbers)   { [ "711111111b", "123456789", "490867715" ] }
    let(:invalid_numbers) do
      [ "888888888", "490067715", "012345678", "86110??36" ]
    end

    let(:valid_accounts) do
      [
        { account_number: "711111111b", valid: true, message: "OK" },
        { account_number: "123456789",  valid: true, message: "OK" },
        { account_number: "490867715",  valid: true, message: "OK" }
      ]
    end

    let(:invalid_accounts) do
      [
        { account_number: "888888888", valid: false, message: "ERR" },
        { account_number: "490067715", valid: false, message: "ERR" },
        { account_number: "012345678", valid: false, message: "ERR" },
        { account_number: "86110??36", valid: false, message: "ILL" }
      ]
    end

    it 'validates valid account numbers' do
      expect(subject.validate_accounts(valid_numbers)).to eq(valid_accounts)
    end

    it 'validates invalid account numbers' do
      expect(subject.validate_accounts(invalid_numbers)).to eq(invalid_accounts)
    end

    it 'returns empty array if account numbers are not sent' do
      expect(subject.validate_accounts([])).to eq([])
    end

  end

  context 'when generating report' do

    let(:accounts) do
      [
        { account_number: "457508000", valid: true,  message: "OK"  },
        { account_number: "664371495", valid: false, message: "ERR" },
        { account_number: "86110??36", valid: false, message: "ILL" }
      ]
    end

    let(:expected_content) do
      "457508000\n664371495 ERR\n86110??36 ILL\n"
    end

    let(:output_path) { File.dirname(__FILE__) + '/user_story_3.out' }
    let(:generated_content) do
      File.open(output_path).read
    end

    it 'has expected content' do
      subject.generate_report(output_path, accounts)

      expect(generated_content).to eq(expected_content)
    end

  end

end
