require 'rails_helper'
require 'spec_helper'

RSpec.describe SuperheroesController, type: :controller do
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

  describe 'GET index' do
    it 'should render index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
  describe 'GET show' do
    it 'should render show template' do
      get :show, params: { id: magneto.id }
      expect(response).to render_template('show')
    end
  end
end
