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

    message = "My name is Christina!"

    expect(encrypt.indexed_char_set).to eq([["a", 1], ["b", 2], ["c", 3], ["d", 4], ["e", 5], ["f", 6], ["g", 7], ["h", 8], ["i", 9], ["j", 10], ["k", 11], ["l", 12], ["m", 13], ["n", 14], ["o", 15], ["p", 16], ["q", 17], ["r", 18], ["s", 19], ["t", 20], ["u", 21], ["v", 22], ["w", 23], ["x", 24], ["y", 25], ["z", 26], [" ", 27]])
  end

  it "turns the incoming message to an array of all lower case" do
    encrypt = Encrypt.new

    message = "My name is Christina!"

    expect(encrypt.split_message(message)).to eq(["m", "y", " ", "n", "a", "m", "e", " ", "i", "s", " ", "c", "h", "r", "i", "s", "t", "i", "n", "a", "!"])
  end

  it "indexes the message" do
    encrypt = Encrypt.new

    message = "My name is Christina!"

    encrypt.split_message(message)

    expect(encrypt.index_message).to eq([["m", 0], ["y", 1], [" ", 2], ["n", 3], ["a", 4], ["m", 5], ["e", 6], [" ", 7], ["i", 8], ["s", 9], [" ", 10], ["c", 11], ["h", 12], ["r", 13], ["i", 14], ["s", 15], ["t", 16], ["i", 17], ["n", 18], ["a", 19], ["!", 20]])
  end

  it "returns char set index number for given letter" do
    encrypt = Encrypt.new
    shift = ShiftGenerator.new

    message = "My name is Christina!"

    encrypt.split_message(message)
    allow_any_instance_of(ShiftGenerator).to receive(:shift).and_return([23, 88, 28, 50])

    expect(encrypt.find_index).to eq(17)
  end

  it 'returns the encrypted letter' do
    encrypt = Encrypt.new
    shift = ShiftGenerator.new

    message = "My name is Christina!"

    encrypt.split_message(message)
    expect(encrypt.encrypted_letter).to eq('n')
  end
end
