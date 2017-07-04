class Professor < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  searchkick
  belongs_to :user
  has_many :reviews
  validates :fullname, :school,  presence: true, length: {maximum: 255}
  validates_uniqueness_of :fullname, :scope => :school
  validates :terms_of_service, acceptance: true
  before_save :downcase_name

#  if Rails.env == 'production'
#  has_attached_file :image,
#  :storage => :cloudinary
#  else
#  has_attached_file :image, styles: { medium: "300x300#", thumbnail: "120x120#" }, :default_url => "/images/:style/missing.png"
#  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/\

 def username
  Review.where("user_id IN (following_ids) OR user_id = :user_id", following_ids: following_ids, user_id: id)
 end

 def recomend
   @review = Review.where(professor_id: id)
   (@review.where(recommend: [true]).count *  100 / @review.count)
 end

 def teachwell
   @review = Review.where(professor_id: id)
   (@review.where(teachwell: [true]).count *  100 / @review.count)
 end


 private

 def downcase_name
   self.fullname = self.fullname.gsub(/(?<=\w)\S+/) { |s| s.downcase }
end

end

#Professor.import
