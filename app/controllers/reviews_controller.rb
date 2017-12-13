class ReviewsController < ApplicationController

  def index
    @superhero = Superhero.find(params[:superhero_id])
    @reviews = @superhero.reviews
  end

  def show; end

  def destroy
  @superhero = Superhero.find(params[:id])
  @reviews = @superhero.reviews
  review.delete
  end
end
