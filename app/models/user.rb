class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :username
  has_many :reviews
  has_many :superheroes
  mount_uploader :profile_photo, ProfilePhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == 'admin'
  end
end
