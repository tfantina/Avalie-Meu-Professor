class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :professor
  validates :ease, :helpfull, :interesting, :comment, presence: true


end
