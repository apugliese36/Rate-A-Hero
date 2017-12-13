require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::SuperheroesController, type: :controller do

  let!(:kjoya) {
    User.create(
      first_name: 'kylee',
      last_name: 'a',
      username: 'kjoya',
      email: 'kjoya@gmail.com',
      password: 'secrectPassword',
      encrypted_password: 'secretPassword'
    )
  }

  let!(:magneto) {
    Superhero.create(
      name: 'Magneto',
      superpower: 'BENDS METAL',
      backstory: 'so sad',
      image_url: 'magneto.com',
      user: kjoya
    )
  }
  let!(:hulk) {
    Superhero.create(
      name: 'Hulk',
      superpower: 'very strong',
      backstory: 'epic',
      image_url: 'hulk.com',
      user: kjoya
    )
  }

  describe 'GET#index' do
    it 'returns a list of all the superheroes' do

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json['superheroes'].length).to eq 2
      expect(returned_json['superheroes'][0]['name']).to eq 'Magneto'
      expect(returned_json['superheroes'][0]['superpower']).to eq 'BENDS METAL'
      expect(returned_json['superheroes'][0]['backstory']).to eq 'so sad'
      expect(returned_json['superheroes'][0]['image_url']).to eq 'magneto.com'

      expect(returned_json['superheroes'][1]['name']).to eq 'Hulk'
      expect(returned_json['superheroes'][1]['superpower']).to eq 'very strong'
      expect(returned_json['superheroes'][1]['backstory']).to eq 'epic'
      expect(returned_json['superheroes'][1]['image_url']).to eq 'hulk.com'
    end
  end

  describe 'GET#show' do
    it 'returns a single hero' do

      get :show, params: {id: 1}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json['superhero']['name']).to eq 'Magneto'
      expect(returned_json['superhero']['superpower']).to eq 'BENDS METAL'
      expect(returned_json['superhero']['backstory']).to eq 'so sad'
      expect(returned_json['superhero']['image_url']).to eq 'magneto.com'
    end
  end

  describe 'POST#create' do
    it 'posts a single hero' do

      params = {
        superhero: {
          name: 'daredevil',
          backstory: 'blind and stuff',
          superpower: 'ninja skills',
          image_url: 'image.png',
          user_id: kjoya.id
        }
      }

      current_superhero_count = Supehero.count

      post :create, params: params
      expect(Program.count).to eq(current_superhero_count + 1)
      expect(response).to have_http_status :ok
    end
  end

end
