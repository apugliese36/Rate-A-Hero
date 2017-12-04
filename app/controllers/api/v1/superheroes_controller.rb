class Api::V1::SuperheroesController < ApplicationController

  def index
    superheroes = Superhero.all
    render json: superheroes
  end

end
