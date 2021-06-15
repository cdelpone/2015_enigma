require 'spec_helper'

RSpec.describe Decrypt do
  it 'exists' do
    decrypt = Decrypt.new

    expect(decrypt).to be_a Decrypt
  end
end
