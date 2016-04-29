require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validate associations" do 
    it { is_expected.to have_many :posts }
  end
end
