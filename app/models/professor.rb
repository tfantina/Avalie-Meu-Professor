require 'elasticsearch/model'
class Professor < ActiveRecord::Base
  attr_accessor :photo
  mount_uploader :photo, PhotoUploader

  #elasticsearch for heroku
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  searchkick
  belongs_to :user
  has_many :reviews

#  if Rails.env == 'production'
#  has_attached_file :image,
#  :storage => :cloudinary
#  else
#  has_attached_file :image, styles: { medium: "300x300#", thumbnail: "120x120#" }, :default_url => "/images/:style/missing.png"
#  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/\

 def username
  Review.where("user_id IN (following_ids) OR user_id = :user_id", following_ids: following_ids, user_id: id)
 end

  Professor.import  #professors will be added automatically to Elasticsearch index
end
