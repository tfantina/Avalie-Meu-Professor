class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :professor
  belongs_to :study

  validates :ease, :helpfull, :interesting, :comment, presence: true
  validates :terms_of_service, acceptance: true
  before_save :compute


  def compute
    self.rating = (ease + interesting + helpfull)/3
  end

end
