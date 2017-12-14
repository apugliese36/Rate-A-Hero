class Vote < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates_presence_of :user_id, :review_id, :value
end
