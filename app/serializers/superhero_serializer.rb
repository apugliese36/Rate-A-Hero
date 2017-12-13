class SuperheroSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :superpower,
             :backstory,
             :image_url,
             :user,
             :reviews,
             :current_user

  def current_user
    scope.current_user
  end
end
