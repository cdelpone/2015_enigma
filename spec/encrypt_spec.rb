require 'spec_helper'

RSpec.describe Encrypt do

 it 'exists' do
   encrypt = Encrypt.new

   expect(encrypt).to be_an Encrypt
 end

  it 'returns 27 character set' do
    encrypt = Encrypt.new

    expect(encrypt.char_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it 'indexes the char set' do
    encrypt = Encrypt.new

    message = 'hello world'

    expect(encrypt.indexed_char_set).to eq([["a", 0], ["b", 1], ["c", 2], ["d", 3], ["e", 4], ["f", 5], ["g", 6], ["h", 7], ["i", 8], ["j", 9], ["k", 10], ["l", 11], ["m", 12], ["n", 13], ["o", 14], ["p", 15], ["q", 16], ["r", 17], ["s", 18], ["t", 19], ["u", 20], ["v", 21], ["w", 22], ["x", 23], ["y", 24], ["z", 25], [" ", 26]])
  end

  it "turns the incoming message to an array of all lower case" do
    encrypt = Encrypt.new

    message = 'hello world'

    expect(encrypt.split_message(message)).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
  end

  it "returns char set index number for given letter" do
    encrypt = Encrypt.new
    shift = ShiftGenerator.new

    message = 'hello world'

    encrypt.split_message(message)

    expect(encrypt.find_index(0)).to eq(7)
  end

  it 'returns the encrypted message' do
    encrypt = Encrypt.new
    shift = ShiftGenerator.new

    allow_any_instance_of(ShiftGenerator).to receive(:shift).and_return([03, 27, 73, 20])
    message = 'hello world'

    encrypt.split_message(message)
    expect(encrypt.encryption).to eq("keder ohulw")
  end
end
