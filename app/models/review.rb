class Review < ActiveRecord::Base
  belongs_to :giver, class_name: 'User', foreign_key: 'giver_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  validates :content, :giver, :receiver, presence: true
  validate :review_length, :not_self 
  

  private
  def review_length
    if content && content.length > 400
      errors.add(:content, "should be less 400 chracters")
    end
  end

  def not_self
    if giver == receiver
      errors.add(:receiver,"should not be yourself") 
    end
  end
end
