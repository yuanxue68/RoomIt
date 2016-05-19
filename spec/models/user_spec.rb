require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validate associations" do 
    it { is_expected.to have_many :posts }
    it { is_expected.to have_many(:favorites) }
    it { is_expected.to have_many(:favorite_posts).through(:favorites).source(:post) }
    it { is_expected.to have_many(:reviews_written).class_name('Review').with_foreign_key('giver_id') }
    it { is_expected.to have_many(:reviews_received).class_name('Review').with_foreign_key('receiver_id') }
    it { should have_attached_file(:avatar) }
  end
end
