class Superhero < ApplicationRecord
  has_many :reviews
  validates_presence_of :name, :superpower, :backstory, :image_url
end
