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

  it 'returns todays date as DDMMYY' do
    shift = ShiftGenerator.new

    expect(shift.convert_today_date('040895')).to eq('040895')
  end

  it 'squares transmission date' do
    shift = ShiftGenerator.new

    allow(shift.transmission_date).to receive(:date).and_return('040895')
    expect(shift.transmission_date('040895')).to eq('1672401025')
  end

  it 'returns and assigns offsets' do
    shift = ShiftGenerator.new
    allow(shift.transmission_date).to receive(:date).and_return('040895')

    expected = a_offset = 1,
              b_offset = 0,
              c_offset = 2,
              d_offset = 5

    expect(shift.assign_offsets).to eq(expected)
  end

  it 'can create shifts' do
    shift = ShiftGenerator.new
    assign_keys = [02, 27, 71, 15]
    assign_offsets = [1, 0, 2, 5]

    expect(shift.create_shifts(assign_keys, assign_offsets)).to eq([03, 27, 73, 20])
  end
end
