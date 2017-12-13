class AddUserIdToSuperheroes < ActiveRecord::Migration[5.1]
  def change
    add_column :superheroes, :user_id, :integer
  end
end
