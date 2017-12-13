class Api::V1::ReviewsController < ApiController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    reviews = Review.all
    render json: reviews
  end

  def show
    render json: Review.find(params[:id])
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: review
    else
      render json:
      { error: review.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def destroy
    @superhero = Superhero.find(params[:id])
    @review = @superhero.reviews.id
    @review.delete
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :comment,
      :superhero_id,
      :user_id
    )
  end
end
