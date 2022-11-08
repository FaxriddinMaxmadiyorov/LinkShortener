require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'always has an original URL and a lookup code' do
    link = Link.new(
      original_url: "https://daryo.uz/xabarlar/messi/world_champion",
      lookup_code: "1234567"
    )
    expect(link.valid?).to eq(true)
  end

  it 'is invalid if does not have a lookup_code' do
    link = Link.new(
      original_url: "https://daryo.uz/xabarlar/messi/world_champion"
    )
    expect(link.valid?).to be(false)
  end

  it 'is invalid if does not have an original URL' do
    link = Link.new(
      lookup_code: '1234567'
    )
    expect(link.valid?).to eq(false)
  end

  it 'is invalid if the lookup code already exists' do
    link = Link.new(
      original_url: 'https://daryo.uz/xabarlar',
      lookup_code: '1234567'
    )
    link.save

    link_2 = Link.new(
      original_url: 'https://daryo.uz/xabarlar',
      lookup_code: '1234567'
    )

    expect(link_2.valid?).to eq(false)
  end

end
