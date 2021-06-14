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

  xit 'returns keys as integers in a hash' do
    shift = ShiftGenerator.new

    expect(shift.assign_keys.integer?).to eq true
  end

  it 'returns todays date as DDMMYY' do
    shift = ShiftGenerator.new

    expect(shift.convert_today_date).to eq('140621')
  end

  it 'squares transmission date' do
    shift = ShiftGenerator.new

    expect(shift.transmission_date).to eq('19636441')
  end

  it 'returns and assigns offsets' do
    shift = ShiftGenerator.new

    expected = a_offset = 6,
              b_offset = 4,
              c_offset = 4,
              d_offset = 1

    expect(shift.assign_offsets).to eq(expected)
  end

  it 'can create shifts' do
    shift = ShiftGenerator.new
    combo_keys = [18, 82, 24, 49]
    combo_offsets = [6, 4, 4, 1]

    expect(shift.create_shifts(combo_keys, combo_offsets)).to eq([24, 86, 28, 50])
  end
end
