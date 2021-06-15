class Enigma

  attr_reader :encrypt

  def initialize
    @encrypt = Hash.new
    @decrypt = Hash.new
  end

  def encrypt(message, key = nil, date = nil)
    @encrypt = {}
    if @encrypt[:encryption].nil?
      @encrypt[:encryption] = @encrypt_message
    end
    if @encrypt[:key].nil?
      @encrypt[:key] = @assign_keys
    end
    if @encrypt[:date].nil?
      @encrypt[:date] = @convert_today_date
    end
    @encrypt
  end

  def decrypt(message, key, date)
    @decrypt = {}
    if @decrypt[:decryption].nil?
      @decrypt[:decryption] = message
    end
    if @decrypt[:key].nil?
      @decrypt[:key] = key
    end
    if @decrypt[:date].nil?
      @decrypt[:date] = date
    end
    @decrypt
  end

end
