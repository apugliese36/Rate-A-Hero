class ReviewSerializer < ActiveModel::Serializer
  attributes :superhero_id, :id, :rating, :comment, :user, :current_user

  def current_user
    scope.current_user
  end
end
