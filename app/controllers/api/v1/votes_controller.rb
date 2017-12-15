class Api::V1::VotesController < ApiController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    votes = Vote.all
    render json: votes
  end

  def show
    render json: Vote.find(params[:id])
  end

  def create
    vote = Vote.new(vote_params)
    review = vote.review
    db_Vote = Vote.where('user_id = ? AND review_id = ?', vote.user_id, vote.review_id)[0]
    if db_Vote
      if db_Vote.value == vote.value
        db_Vote.value = 0
        if vote.value == -1
          review.dislikes -= 1
          review.save
        else
          review.likes -= 1
          review.save
        end
      else
        if vote.value == -1
          review.dislikes += 1
          if db_Vote.value == 1
            review.likes -= 1
          end
          review.save
        else
          review.likes += 1
          if db_Vote.value == -1
            review.dislikes -= 1
          end
          review.save
        end
        db_Vote.value = vote.value
      end
      db_Vote.save
    else
      vote.save
      if vote.value == -1
        review.dislikes += 1
        review.save
      else
        review.likes += 1
        review.save
      end
    end
    render json: Superhero.find(review.superhero_id).reviews.order(:likes).reverse
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :user_id, :review_id)
  end
end

#program
