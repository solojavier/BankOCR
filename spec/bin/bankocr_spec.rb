require 'bankocr'

describe 'Application execution' do

  let(:input)  { File.dirname(__FILE__) + '/input.in' }
  let(:output) { File.dirname(__FILE__) + '/report.out' }

  let(:report) do
    "711111111\n777777177\n200800000\n333393333\n888888888 ERR\n" \
    "555555555 ERR\n666666666 ERR\n999999999 ERR\n490067715 ERR\n" \
    "123456789\n000000051\n49086771? ILL\n"
  end

  before do
    File.delete(output) if File.exist?(output)
  end

  it 'parses file and creates report', integration: true do
    BankOCR.process(input, output)

    expect(File.open(output).read).to eq(report)
  end

end
