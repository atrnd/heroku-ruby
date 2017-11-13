require 'rails_helper'

RSpec.describe "shops/index", type: :view do
  before(:each) do
    assign(:shops, [
      Shop.create!(),
      Shop.create!()
    ])
  end

  it "renders a list of shops" do
    render
  end
end
