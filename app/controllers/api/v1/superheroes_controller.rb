class Api::V1::SuperheroesController < ApiController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    superheroes = Superhero.all
    render json: { superheroes: Superhero.all, current_user: current_user }
  end

  def show
    render json: Superhero.find(params[:id])
  end

  def create
    superhero = Superhero.new(superhero_params)
    if superhero.save
      render json: superhero
    else
      render json:
      { error: superhero.errors.full_messages },
        status: :unprocessable_entity
    end
  end


  private

  def superhero_params
    params.require(:superhero).permit(
      :name,
      :backstory,
      :superpower,
      :image_url
    )
  end
end
