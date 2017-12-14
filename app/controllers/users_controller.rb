class UsersController < ApplicationController
  before_action :authorize_user, except: [:index]

  def index
    @users = User.all
  end
end
