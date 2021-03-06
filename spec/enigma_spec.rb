require 'spec_helper'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_an Enigma
  end

  xit 'encrypts' do
    enigma = Enigma.new
    cipher = Cipher.new
    shift = ShiftGenerator.new

    expected = {
      encryption: 'keder ohulw',
      key: '02715',
      date: '040895'
    }

    expect(enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
  end

  xit 'decrypts' do
    enigma = Enigma.new

    expected = {
      encryption: 'hello world',
      key: '02715',
      date: '040895'
    }

    expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq(expected)
  end
end
