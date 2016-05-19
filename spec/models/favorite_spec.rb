require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :user }
    it { is_expected.to validate_presence_of :post }
  end 

  describe "associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :post }
  end
end
