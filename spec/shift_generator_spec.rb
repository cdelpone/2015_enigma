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

  it 'returns keys as integers' do
    shift = ShiftGenerator.new

    expect(shift.assign_keys.integer?).to eq true
  end

  it 'returns todays date as DDMMYY' do
    shift = ShiftGenerator.new

    expect(shift.convert_today_date).to eq('130621')
  end
end
