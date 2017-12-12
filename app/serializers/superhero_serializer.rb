class SuperheroSerializer < ActiveModel::Serializer
  attributes :id, :name, :superpower, :backstory, :image_url, :reviews

end
