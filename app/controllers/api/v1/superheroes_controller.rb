class Api::V1::SuperheroesController < ApiController

  def index
    superheroes = Superhero.all
    render json: superheroes
  end

  def show
    render json: { superhero: Superhero.find(params[:id]) }
  end

end
