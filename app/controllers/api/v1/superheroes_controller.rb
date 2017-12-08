class Api::V1::SuperheroesController < ApiController
  before_action :authorize_user, except: [:index, :show]

  def index
    superheroes = Superhero.all
    render json: superheroes
  end

  def show
    render json: Superhero.find(params[:id])
  end

  def authorize_user
    return unless user_signed_in? || current_user.admin?
    raise ActionController::RoutingError, 'Not Found'
    fail 'message'
  end
end
