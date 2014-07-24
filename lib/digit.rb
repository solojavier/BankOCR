module BankOCR
  class Digit
    attr_reader :value, :shape

    def initialize(shape)
      @shape = shape
      @value = CONVERSIONS[shape] || '?'
    end

    CONVERSIONS = {
      ' _ ' \
      '| |' \
      '|_|' => '0',
      '   ' \
      '  |' \
      '  |' => '1',
      ' _ ' \
      ' _|' \
      '|_ ' => '2',
      ' _ ' \
      ' _|' \
      ' _|' => '3',
      '   ' \
      '|_|' \
      '  |' => '4',
      ' _ ' \
      '|_ ' \
      ' _|' => '5',
      ' _ ' \
      '|_ ' \
      '|_|' => '6',
      ' _ ' \
      '  |' \
      '  |' => '7',
      ' _ ' \
      '|_|' \
      '|_|' => '8',
      ' _ ' \
      '|_|' \
      ' _|' => '9'
    }
  end
end
