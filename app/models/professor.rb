
class Professor < ActiveRecord::Base

  searchkick
  belongs_to :user
  has_many :reviews
  validates :fullname, :school, :department,  presence: true, length: {maximum: 255}

#  if Rails.env == 'production'
#  has_attached_file :image,
#  :storage => :cloudinary
#  else
#  has_attached_file :image, styles: { medium: "300x300#", thumbnail: "120x120#" }, :default_url => "/images/:style/missing.png"
#  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/\

 def username
  Review.where("user_id IN (following_ids) OR user_id = :user_id", following_ids: following_ids, user_id: id)
 end


end
