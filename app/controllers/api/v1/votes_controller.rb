class Api::V1::VotesController < ApiController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    votes = Vote.all
    render json: votes
  end

  def show
    render json: Vote.find(params[:id])
  end

  # def create
  #   review = Review.new(review_params)
  #   if review.save
  #     render json: review
  #   else
  #     render json:
  #     { error: review.errors.full_messages },
  #       status: :unprocessable_entity
  #   end
  # end
  #
  # private
  #
  # def review_params
  #   params.require(:review).permit(
  #     :rating,
  #     :comment,
  #     :superhero_id,
  #     :user_id
  #   )
  # end
end
