class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end