class Api::V1::SuperheroesController < ApiController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_permission, only: [:destroy]

  def require_permission
    @superhero = Superhero.find(params[:id])
    return false if current_user.id != @superhero.user.id || !current_user.admin?
      redirect_to :root
  end

  def index
    superheroes = Superhero.all
    render json: superheroes
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

  def destroy
    @superhero = Superhero.find(params[:id])
    @superhero.delete
  end

  private

  def superhero_params
    params.require(:superhero).permit(
      :name,
      :backstory,
      :superpower,
      :image_url,
      :user_id
    )
  end
end
