class CreateSuperheroes < ActiveRecord::Migration[5.1]
  def change
    create_table :superheroes do |t|
      t.string :name, null: false
      t.string :superpower, null: false
      t.string :backstory, null: false
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
