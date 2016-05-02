require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validate associations" do
    it { is_expected.to belong_to :user }
  end

  describe "validate validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :home_type }
    it { is_expected.to validate_presence_of :room_type }
    it { is_expected.to validate_presence_of :bedroom }
    it { is_expected.to validate_presence_of :bathroom }
    it { is_expected.to validate_presence_of :street_address }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_presence_of :province }
    it { is_expected.to validate_presence_of :postal_code }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_length_of(:title).is_at_most 80 }
    it { is_expected.to validate_length_of(:description).is_at_most 500 }
  end
end
