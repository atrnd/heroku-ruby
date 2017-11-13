require 'rails_helper'

RSpec.describe "shops/show", type: :view do
  before(:each) do
    @shop = assign(:shop, Shop.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
