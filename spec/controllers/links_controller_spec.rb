require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  it 'can shorten a link provided by a user' do
    url = 'https://gitlab.com/upay.net/uzpaynet/-/tree/master/app/services'
    headers = { "CONTENT_TYPE" => "text/javascript" }
    # byebug
    post :create, params: { link: { original_url: url } }
    link = assigns(:link)
    expect(link.original_url).to eq(url)
    expect(link.valid?).to be(true)
    expect(link.lookup_code.length).to eq(7)

  end

end