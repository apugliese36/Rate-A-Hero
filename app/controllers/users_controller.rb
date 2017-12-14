class UsersController < ApplicationController
  before_action :authorize_user, except: [:index]

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to :root
  end

  def authorize_user
    if !user_signed_in? && !current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
