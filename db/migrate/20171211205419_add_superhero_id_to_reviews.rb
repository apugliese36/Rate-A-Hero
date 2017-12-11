class AddSuperheroIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :superhero_id, :integer
  end
end
