class Review < ApplicationRecord
  belongs_to :superhero
  validates :rating, presence: true, inclusion: { in: 1..5 }
end
