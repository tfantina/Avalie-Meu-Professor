class Study < ActiveRecord::Base

  # Model called "Study" because "Class" is a restricted Ruby word and we musen't
  # name a table after a Ruby word!
  has_many :reviews
  validates :study presence: true
end
