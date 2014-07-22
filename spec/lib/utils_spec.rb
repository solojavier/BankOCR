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
end
