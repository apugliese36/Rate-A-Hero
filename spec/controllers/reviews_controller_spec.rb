# require 'rails_helper'
# require 'spec_helper'
#
# RSpec.describe ReviewsController, type: :controller do
#
#   let!(:kjoya) {
#     User.create(
#       first_name: 'kylee',
#       last_name: 'a',
#       username: 'kjoya',
#       email: 'kjoya@gmail.com',
#       password: 'secrectPassword',
#       encrypted_password: 'secretPassword'
#     )
#   }
#
#   let!(:hulk) {
#     Superhero.create(
#       name: 'Hulk',
#       superpower: 'very strong',
#       backstory: 'epic',
#       image_url: 'hulk.com',
#       user: kjoya
#     )
#   }
#
#   let!(:review) {
#     Review.create(
#       rating: 3,
#       comment: "Hallo",
#       superhero_id: hulk.id,
#       user_id: kjoya.id
#     )
#   }
#
#   describe 'GET index' do
#     it 'should render index template' do
#       get :index
#       expect(response).to render_template('index')
#     end
#   end
#   describe 'GET show' do
#     it 'should render show template' do
#       get :show, params: { id: review.id }
#       expect(response).to render_template('show')
#     end
#   end
# end
