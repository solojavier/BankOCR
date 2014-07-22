require_relative '../application'

describe BankOCR::Application do

  let(:input)  { File.dirname(__FILE__) + '/ocr_input.in' }
  let(:output) { File.dirname(__FILE__) + '/accounts_report.out' }

  let(:report) do
    "711111111\n777777177\n200800000\n333393333\n888888888 ERR\n555555555 ERR\n666666666 ERR\n999999999 ERR\n490067715 ERR\n123456789\n000000051\n49086771? ILL\n"
  end

  subject { described_class.new(input, output) }

  it 'parses file and creates report' do
    subject.run

    expect(File.open(output).read).to eq(report)
  end

end
