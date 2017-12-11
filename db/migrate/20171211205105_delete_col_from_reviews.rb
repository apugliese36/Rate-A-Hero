class DeleteColFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :superhero_id, :bigint
  end
end
