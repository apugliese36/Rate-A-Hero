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
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
