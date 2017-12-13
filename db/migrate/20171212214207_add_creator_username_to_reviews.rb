class AddCreatorUsernameToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :creator_username, :string
  end
end
