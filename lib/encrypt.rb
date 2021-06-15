class Encrypt
  attr_reader :message

  def initialize
  end

  def char_set
    char_set = ("a".."z").to_a << " "
  end

  def indexed_char_set
    char_set.map.with_index(1).to_a
  end

  def split_message(message)
    @new_message = message.downcase.split("")
  end

  def index_message
    @new_message.map.with_index(0).to_a
  end

  def find_index
    shift = ShiftGenerator.new
    index = 0
    result = char_set.each_index.detect do |i|
      char_set[i] == @new_message[index]
    end
    index += 1
    new_char_index = result + shift.rotate!(3)[0]
    # require "pry"; binding.pry
  end

  def encrypted_letter
  encrypted_message = []
    encrypted_message << char_set[@new_char_index.to_i]
    encrypted_message
  end
end


#   def rotate_shifts
#     shift = ShiftGenerator.new
#     # new_char_index = result + @rotate_shift
#     if rotate_shift == shift.a_shift[0]
#       shift.a_shift[0]
#       rotate_shift = shift.b_shift[0]
#     elsif rotate_shift == shift.b_shift[0]
#       shift.b_shift[0]
#       rotate_shift = shift.c_shift[0]
#     elsif rotate_shift == shift.c_shift[0]
#       shift.c_shift[0]
#       rotate_shift = shift.d_shift[0]
#     else rotate_shift == shift.d_shift[0]
#       shift.d_shift[0]
#       rotate_shift = shift.a_shift[0]
#   end
# end
