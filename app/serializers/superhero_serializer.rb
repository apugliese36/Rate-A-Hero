class SuperheroSerializer < ActiveModel::Serializer
  attributes :id, :name, :superpower, :backstory, :image_url, :reviews

  # def reviews
  #   ReviewsSerializer.new(object.reviews)
  # end
end
