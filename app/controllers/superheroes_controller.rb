class SuperheroesController < ApplicationController
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
end
