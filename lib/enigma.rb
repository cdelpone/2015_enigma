require './lib/shift_generator'
require './lib/cipher'

class Enigma
  attr_reader :encrypt,
              :new_keys,
              :new_date

  def initialize
    @encrypt = {}
    @decrypt = {}
    @shift = ShiftGenerator.new
    @new_keys = @shift.assign_keys
    @new_date = @shift.convert_today_date
  end

  def encrypt(message, key = @new_keys, date = @new_date)
    @encrypt = {}
    shift = ShiftGenerator.new
    cipher = Cipher.new
    @encrypt[:encryption] = cipher.encrypt_message(message)
    @encrypt[:key] = key
    @encrypt[:date] = date
    @encrypt
  end

  def decrypt(message, key, date)
    @decrypt = {}
    @decrypt[:decryption] = message if @decrypt[:decryption].nil?
    @decrypt[:key] = key if @decrypt[:key].nil?
    @decrypt[:date] = date if @decrypt[:date].nil?
    @decrypt
  end
end
