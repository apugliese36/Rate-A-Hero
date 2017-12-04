class Superhero < ApplicationRecord
  validates_presence_of :name, :superpower, :backstory, :image_url
end
