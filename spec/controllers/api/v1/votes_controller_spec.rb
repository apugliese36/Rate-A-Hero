require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::VotesController, type: :controller do

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

  let!(:vote) do
    Vote.create(
      user_id: kjoya.id,
      review_id: review.id,
      value: 1
    )
  end

  describe 'GET#index' do
    it 'returns a list of all the votes' do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json.length).to eq 1
      expect(returned_json[0]['user_id']).to eq kjoya.id
      expect(returned_json[0]['review_id']).to eq review.id
      expect(returned_json[0]['value']).to eq 1
    end
  end

  describe 'GET#show' do
    it 'returns a single vote' do

      get :show, params: { id: vote.id }
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json['user_id']).to eq kjoya.id
      expect(returned_json['review_id']).to eq review.id
      expect(returned_json['value']).to eq 1
    end
  end
end
