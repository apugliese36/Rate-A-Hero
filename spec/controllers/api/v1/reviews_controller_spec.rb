require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
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

  let!(:magneto) do
    Superhero.create(
      name: 'Magneto',
      superpower: 'BENDS METAL',
      backstory: 'so sad',
      image_url: 'magneto.com',
      user: kjoya
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

  describe 'GET#index' do
    it 'returns a list of all the superheroes' do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json['reviews'].length).to eq 1
      expect(returned_json['reviews'][0]['rating']).to eq 3
      expect(returned_json['reviews'][0]['comment']).to eq 'Hallo'
      expect(returned_json['reviews'][0]['superhero_id']).to eq hulk.id
      expect(returned_json['reviews'][0]['user']['id']).to eq kjoya.id
    end
  end

  describe 'GET#show' do
    it 'returns a single review' do
      get :show, params: { id: review.id }
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json['review']['rating']).to eq 3
      expect(returned_json['review']['comment']).to eq 'Hallo'
      expect(returned_json['review']['superhero_id']).to eq hulk.id
      expect(returned_json['review']['user']['id']).to eq kjoya.id
    end
  end

  describe 'POST#create' do
    it 'posts a single hero' do
      sign_in kjoya

      params = {
      review:
        {
          rating: 1,
          comment: 'so gud',
          superhero_id: hulk.id,
          user_id: kjoya.id
        }
      }

      expect { post :create, params: params }.to change(Review, :count).by(1)
    end
  end
end
