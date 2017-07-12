class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :professor
  validates :ease, :helpfull, :interesting, :comment, presence: true
  validates :terms_of_service, acceptance: true
  before_save :compute_avg


  def compute_avg
    self.rating = (ease + interesting + helpfull)/3
  end

  def self.search(search)
    if search
      where('comment LIKE ?', "%#{search}%")
    else
      self.all
    end
  end


end
