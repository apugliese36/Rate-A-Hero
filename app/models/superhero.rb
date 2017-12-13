class Superhero < ApplicationRecord
  has_many :reviews
  belongs_to :user
  validates_presence_of :name, :superpower, :backstory, :image_url
end
