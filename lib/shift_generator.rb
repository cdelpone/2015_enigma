class ShiftGenerator

  def initialize
    @random_nums = Array.new(5)
    @assign_keys = assign_keys
    @assign_offsets = assign_offsets
  end

  def random_nums
    nums = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    @random_nums = nums.sample(5)
  end

  def assign_keys
     @a_key = @random_nums[0,2].join.to_i
     @b_key = @random_nums[1,2].join.to_i
     @c_key = @random_nums[2,2].join.to_i
     @d_key = @random_nums[3,2].join.to_i
  end

  def convert_today_date
    date = Date.today.strftime('%d%m%y'.gsub('yy', '%y'))
  end

  # def transmission_date(date)
  #   date
  # end
  #
  # def assign_offsets
  #   # assigns the transmission date squared to each variable
  # end
  #
  # def create_a_shift(a_key, a_offset)
  # end
end





    # assign A to index 0, 1 of the random nums
    # assign B to index 1, 2 of the random nums
    # assign C to index 2, 3 of the random nums
    # assign D to index 3, 4 of the random nums
