require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:giver).class_name('User').with_foreign_key('giver_id') }
    it { is_expected.to belong_to(:receiver).class_name('User').with_foreign_key('receiver_id') }
  end

  describe "validations" do 
    let(:user) {create(:user)}
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :giver }
    it { is_expected.to validate_presence_of :receiver }
    it { is_expected.to validate_length_of(:content).is_at_most(400) }
    it "validates giver is not receiver" do 
      review = build(:review, giver: user, receiver: user, content: "content")
      expect(review).to be_invalid
    end
  end
end
