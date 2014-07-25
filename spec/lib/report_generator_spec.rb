require 'spec_helper'

RSpec.describe BankOCR::ReportGenerator do

  let(:accounts) do
    [
      instance_double('BankOCR::AccountNumber',
                      to_s: '457508000', valid?: true),
      instance_double('BankOCR::AccountNumber',
                      to_s: '664371495', valid?: false),
      instance_double('BankOCR::AccountNumber',
                      to_s: '86110??36', valid?: false)
    ]
  end

  let(:expected_content) do
    "457508000\n664371495 ERR\n86110??36 ILL\n"
  end

  let(:output_path) { File.dirname(__FILE__) + '/user_story_3.out' }

  let(:generated_content) do
    File.open(output_path).read
  end

  before do
    File.delete(output_path) if File.exist?(output_path)
  end

  it 'creates empty file if accounts are not sent' do
    described_class.new(output_path, []).save!

    expect(generated_content).to eq('')
  end

  it 'creates expected content' do
    described_class.new(output_path, accounts).save!

    expect(generated_content).to eq(expected_content)
  end

end
