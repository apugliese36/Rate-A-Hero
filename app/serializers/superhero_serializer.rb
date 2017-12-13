class SuperheroSerializer < ActiveModel::Serializer
  attributes :id, :name, :superpower, :backstory, :image_url, :reviews, :current_user

  def current_user
    return scope.current_user
  end
end
