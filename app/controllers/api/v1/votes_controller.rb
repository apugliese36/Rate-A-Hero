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
    dbVote = Vote.where('user_id = ? AND review_id = ?', vote.user_id, vote.review_id)[0]
    if dbVote
      if dbVote.value == vote.value
        dbVote.value = 0
        render json: { message: "vote updated 0" }
      else
        dbVote.value = vote.value
        render json: { message: "vote updated 1/-1" }
      end
      dbVote.save
    else
      vote.save
      render json: { message: "new vote created" }
    end

  end


  #   user = current_user
  #   vote.user = user
  #   dbVote = Vote.where('user_id = ? AND review_id = ?', vote.user_id, vote.review_id)[0]
  #   if dbVote
  #     if dbVote.value == vote.value
  #       dbVote.value = 0
  #     else
  #       dbVote.value = vote.value
  #     end
  #     dbVote.save
  #     vote = dbVote
  #   else vote.save
  #   end
  #   if vote.persisted?
  #     votes = vote.review.votes
  #     vote.review.vote_count = votes.map(&:value).inject(0, &:+)-votes.length
  #     vote.review.save
  #     reviews = Superhero.find(params[:superhero_id]).reviews.order(:created_at).reverse
  #     userVotes = Vote.where('user_id = ? AND superhero = ?', user.id, params[:superhero_id])
  #     render json: {
  #       reviews: reviews,
  #       userVotes: userVotes
  #     }
  #   else
  #     render json: { error: vote.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  #   if review.save
  #     render json: review
  #   else
  #     render json:
  #     { error: review.errors.full_messages },
  #       status: :unprocessable_entity
  #   end
  # end

  private

  def vote_params
    params.require(:vote).permit(:value, :user_id, :review_id)
  end
end
