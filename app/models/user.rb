class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_attached_file :avatar, styles: {medium: "250x250", large: "500x500"}, processors: [:cropper]
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_avatar, if: :should_crop?

  def should_crop?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def crop_avatar
  	avatar.assign(avatar)
  	avatar.save
  end

  def avatar_geometry(style = :original)
    @geometry ||={}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.path(style))
  end


end