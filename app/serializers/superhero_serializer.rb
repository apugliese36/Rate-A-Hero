class SuperheroSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :superpower,
             :backstory,
             :image_url,
             :user_id,
             :user,
             :reviews,
             :current_user

  def current_user
    scope.current_user
  end
  
  def admin?
    scope.current_user.admin?
  end
end
