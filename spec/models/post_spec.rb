require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validate associations" do
    it { is_expected.to belong_to :user }
  end
end
