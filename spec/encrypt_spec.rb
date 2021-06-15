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

    expect(encrypt.indexed_char_set).to eq([["a", 0], ["b", 1], ["c", 2], ["d", 3], ["e", 4], ["f", 5], ["g", 6], ["h", 7], ["i", 8], ["j", 9], ["k", 10], ["l", 11], ["m", 12], ["n", 13], ["o", 14], ["p", 15], ["q", 16], ["r", 17], ["s", 18], ["t", 19], ["u", 20], ["v", 21], ["w", 22], ["x", 23], ["y", 24], ["z", 25], [" ", 26]])
  end

  it "turns the incoming message to an array of all lower case" do
    encrypt = Encrypt.new

    message = "My name is Christina!"

    expect(encrypt.split_message(message)).to eq(["m", "y", " ", "n", "a", "m", "e", " ", "i", "s", " ", "c", "h", "r", "i", "s", "t", "i", "n", "a", "!"])
  end

  xit "indexes the message" do
    encrypt = Encrypt.new

    message = "My name is Christina!"

    encrypt.split_message(message)

    expect(encrypt.index_message).to eq([["m", 1], ["y", 2], [" ", 3], ["n", 4], ["a", 5], ["m", 6], ["e", 7], [" ", 8], ["i", 9], ["s", 10], [" ", 11], ["c", 12], ["h", 13], ["r", 14], ["i", 15], ["s", 16], ["t", 17], ["i", 18], ["n", 19], ["a", 20], ["!", 21]])
  end

  it "returns char set index number for given letter" do
    encrypt = Encrypt.new
    shift = ShiftGenerator.new

    message = "My name is Christina!"

    encrypt.split_message(message)

    expect(encrypt.find_index).to eq(12)
  end

  it 'returns the encrypted letter' do
    encrypt = Encrypt.new
    shift = ShiftGenerator.new

    allow_any_instance_of(ShiftGenerator).to receive(:shift).and_return([23, 88, 28, 50])
    message = "My name is Christina!"

    encrypt.split_message(message)
    expect(encrypt.encrypted_letter).to eq(['n'])
  end
end
