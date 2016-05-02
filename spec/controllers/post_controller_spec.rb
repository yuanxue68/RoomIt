require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "valide params" do
    login_user
    it "should permit post_params" do
      params = {
        post: {
          title: "post",
          description: "room",
          home_type: "house",
          room_type: "shared",
          bathroom: 1,
          street_address: "111 some road",
          city: "toronto",
          province: "On",
          postal_code: "m5t 1la",
          has_tv: true,
          has_kitchen: true,
          has_heating: true,
          had_interNet: true,
          price: 50
        }
      }
      should permit(:title, :description, :home_type, :room_type, :bedroom, :bathroom, :street_address, :city, :province, :postal_code, :has_tv, :has_kitchen, :has_air, :has_heating, :has_internet, :price).
        for(:create, params: params).
        on(:post)
    end
  end
end
