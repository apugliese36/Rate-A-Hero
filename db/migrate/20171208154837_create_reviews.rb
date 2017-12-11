class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :comment
      t.belongs_to :superhero, null: false

      t.timestamps
    end
  end
end
