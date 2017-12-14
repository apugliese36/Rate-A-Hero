class ReviewSerializer < ActiveModel::Serializer
  attributes :superhero_id, :id, :rating, :comment, :user, :votes, :current_user

  def current_user
    scope.current_user
  end

  def admin?
    scope.current_user.admin?
  end
end
