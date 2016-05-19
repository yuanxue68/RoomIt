class Review < ActiveRecord::Base
  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  validates :content, :giver, :receiver, presence: true
  validates :content, length: {maximum: 400}
  validate :not_self 
  

  private
  def not_self
    if giver == receiver
      errors.add(:receiver,"should not be yourself") 
    end
  end
end
