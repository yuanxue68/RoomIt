class Post < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  validates :title, :description, :home_type, :room_type, :bedroom, :bathroom, :street_address, :city, :province, :postal_code, :price, presence: true
  validates :title, length: { maximum: 80 }
  validates :description, length: { maximum: 500 }
  geocoded_by :full_street_address
  after_validation :geocode 

  def full_street_address
    "#{self.street_address}, #{self.city}, #{self.province} #{postal_code}"
  end

  def self.search_listing(search_params)
    postSeach = PostSearch.new(search_params)
    postSeach.posts
  end
end
