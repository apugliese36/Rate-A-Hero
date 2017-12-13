class Review < ApplicationRecord
  belongs_to :superhero
  belongs_to :user
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
