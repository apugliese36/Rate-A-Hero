class SuperheroesController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    @superheroes = Superhero.all
  end

  def show
    @superhero = Superhero.find(params[:id])
    @reviews = @superhero.reviews
  end

  def destroy
    @superhero = Superhero.find(params[:id])
    @superhero.delete
    redirect_to :root
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
