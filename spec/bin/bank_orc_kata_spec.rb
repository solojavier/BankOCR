describe "Application execution" do

  let(:input)  { File.dirname(__FILE__) + '/ocr_input.in' }
  let(:output) { File.dirname(__FILE__) + '/accounts_report.out' }

  let(:report) do
    "711111111\n777777177\n200800000\n333393333\n888888888 ERR\n555555555 ERR\n666666666 ERR\n999999999 ERR\n490067715 ERR\n123456789\n000000051\n49086771? ILL\n"
  end

  subject { Object.new.extend(BankOCR::Utils) }

  it 'parses file and creates report' do
    account_numbers = subject.parse_file(input)
    accounts        = subject.validate_accounts(account_numbers)

    subject.generate_report(output, accounts)

    expect(File.open(output).read).to eq(report)
  end

end
