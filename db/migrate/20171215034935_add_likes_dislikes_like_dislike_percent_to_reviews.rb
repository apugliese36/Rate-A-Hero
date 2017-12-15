class AddLikesDislikesLikeDislikePercentToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :likes, :integer, default: 0
    add_column :reviews, :dislikes, :integer, default: 0
  end
end
