class Encrypt
  attr_reader :message

  def initialize
    @new_message = []
    @encrypted_message = []
  end

  def char_set
    char_set = ("a".."z").to_a << " "
  end

  def indexed_char_set
    @new_char_set = char_set.map.with_index(0).to_a
  end

  def split_message(message)
    @new_message = message.downcase.split("")
    @new_message.flatten
  end

  # def index_message
  #   @new_message.map.with_index(1).to_a
  # end

  def find_index
    @index = 0
    @result = char_set.each_index.detect do |i|
      char_set[i] == @new_message[@index]
    end
    @index += 1
    @result
  end

  def encrypted_letter
    @index = 0
    while @index <= (@new_message.count -1)
      find_index
    shift = ShiftGenerator.new
    new_char_index = @result + shift.all_shifts.rotate!(3)[0]
    @encrypted_message << char_set[new_char_index.to_i % 27]
  end
  @encrypted_message
end

  def loop
    @new_messages.map do |letter|
      letter.encrypted_letter
    end
  end
end
