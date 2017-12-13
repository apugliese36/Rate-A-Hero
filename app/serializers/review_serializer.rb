class ReviewSerializer < ActiveModel::Serializer
  attributes :superhero_id, :id, :rating, :comment, :user
end
