require 'rails_helper'
require 'spec_helper'

RSpec.describe ReviewsController, type: :controller do
  let!(:kjoya) do
    User.create(
      first_name: 'kylee',
      last_name: 'a',
      username: 'kjoya',
      email: 'kjoya@gmail.com',
      password: 'secrectPassword',
      encrypted_password: 'secretPassword'
    )
  end

  let!(:hulk) do
    Superhero.create(
      name: 'Hulk',
      superpower: 'very strong',
      backstory: 'epic',
      image_url: 'hulk.com',
      user: kjoya
    )
  end

  let!(:review) do
    Review.create(
      rating: 3,
      comment: 'Hallo',
      superhero_id: hulk.id,
      user_id: kjoya.id
    )
  end
end
