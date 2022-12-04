require 'rails_helper'

RSpec.describe Shortener do

  it 'shortens a given URL to a 7 character lookup code' do
    url = 'https://gitlab.com/upay.net/uzpaynet/-/tree/master/app/services'
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end

  it 'gives each URL its own lookup_code' do
    url = 'https://gitlab.com/upay.net/uzpaynet/-/tree/master/app/services'
    shortener = Shortener.new(url)
    code_1 = shortener.lookup_code

    url = 'https://gitlab.com/upay.net/uzpaynet/-/tree/master/app/controllers'
    shortener = Shortener.new(url)
    code_2 = shortener.lookup_code
    puts code_1 + " %% " + code_2
    expect(code_1).not_to eq(code_2)
  end

  it 'always gives the same lookup_code for the same URL' do
    url = 'https://gitlab.com/upay.net/uzpaynet/-/tree/master/app/services'
    shortener = Shortener.new(url)
    code_1 = shortener.lookup_code

    url = 'https://gitlab.com/upay.net/uzpaynet/-/tree/master/app/services'
    shortener = Shortener.new(url)
    code_2 = shortener.lookup_code

    expect(code_1).to eq(code_2)
  end

  it 'generates a Link record with a unique lookup code' do
    url = 'https://daryo.uz/xabarlar/321'
    shortener = Shortener.new(url)
    link = shortener.generate_short_link
    expect(link.valid?).to be(true)

    link = shortener.generate_short_link
    expect(link.valid?).to be(true)
  end

end