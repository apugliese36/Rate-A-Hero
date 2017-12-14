class Review < ApplicationRecord
  belongs_to :superhero
  belongs_to :user
  has_many :votes
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
