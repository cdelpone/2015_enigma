class Enigma

  attr_reader :encrypt

  def initialize
    @encrypt = Hash.new
    @decrypt = Hash.new
    # @encryption = encrypt[:encryption]
    # @key = encrypt[:key]
    # @date = encrypt[:date]
  end

  def encrypt(message, key, date)
    @encrypt = {}
    if @encrypt[:encryption].nil?
      @encrypt[:encryption] = encrypted_message
    end
    # if @encrypt[:key].nil?
    #   @encrypt[:key] = key
    # end
    # if @encrypt[:date].nil?
    #   @encrypt[:date] = date
    # end
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
