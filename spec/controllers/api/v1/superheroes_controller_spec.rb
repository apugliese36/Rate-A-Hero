require 'rails_helper'

RSpec.describe Api::V1::SuperheroesController, type: :controller do
  let!(:magneto) {
    Superhero.create(
      name: 'Magneto',
      superpower: 'BENDS METAL',
      backstory: 'so sad',
      image_url: 'magneto.com'
    )
  }
  let!(:hulk) {
    Superhero.create(
      name: 'Hulk',
      superpower: 'very strong',
      backstory: 'epic',
      image_url: 'hulk.com'
    )
  }

  describe 'GET#index' do
    it 'returns a list of all the superheroes' do

      get:index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq('application/json')

      expect(returned_json.length).to eq 2
      expect(returned_json[0]['name']).to eq 'Magneto'
      expect(returned_json[0]['superpower']).to eq 'BENDS METAL'
      expect(returned_json[0]['backstory']).to eq 'so sad'
      expect(returned_json[0]['image_url']).to eq 'magneto.com'

      expect(returned_json[1]['name']).to eq 'Hulk'
      expect(returned_json[1]['superpower']).to eq 'very strong'
      expect(returned_json[1]['backstory']).to eq 'epic'
      expect(returned_json[1]['image_url']).to eq 'hulk.com'
    end
  end
end
