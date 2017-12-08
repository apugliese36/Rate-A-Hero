module ApplicationHelper

  def user_avatar user
    if user.profile_photo.present?
      image_tag user.image_url :thumbnail
    else
      # Assuming you have a default.jpg in your assets folder
      image_tag 'default.jpg'
    end
  end

end
