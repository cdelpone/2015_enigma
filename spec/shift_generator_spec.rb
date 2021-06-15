require 'spec_helper'

RSpec.describe ShiftGenerator do

  it 'exists' do
    shift = ShiftGenerator.new

    expect(shift).to be_a ShiftGenerator
  end

  it 'generates 5 random digits' do
    shift = ShiftGenerator.new

    expect(shift.random_nums.length).to eq 5
  end

  it 'returns keys an array' do
    shift = ShiftGenerator.new

    expect(shift.assign_keys.class).to eq Array
  end

  it 'squares transmission date' do
    shift = ShiftGenerator.new

    expect(shift.transmission_date).to eq('19774265641')
  end

  it 'returns and assigns offsets' do
    shift = ShiftGenerator.new

    expected = a_offset = 5,
              b_offset = 6,
              c_offset = 4,
              d_offset = 1

    expect(shift.assign_offsets).to eq(expected)
  end

  it 'can create shifts' do
    shift = ShiftGenerator.new
    assign_keys = [18, 82, 24, 49]
    assign_offsets = [5, 6, 4, 1]

    expect(shift.create_shifts(assign_keys, assign_offsets)).to eq([23, 88, 28, 50])
  end
end
