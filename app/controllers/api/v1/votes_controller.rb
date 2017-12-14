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
    db_Vote = Vote.where('user_id = ? AND review_id = ?', vote.user_id, vote.review_id)[0]
    if db_Vote
      if db_Vote.value == vote.value
        db_Vote.value = 0
        render json: { message: 'vote updated 0' }
      else
        db_Vote.value = vote.value
        render json: { message: 'vote updated 1/-1' }
      end
      db_Vote.save
    else
      vote.save
      render json: { message: 'new vote created' }
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value, :user_id, :review_id)
  end
end
