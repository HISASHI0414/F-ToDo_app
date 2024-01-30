class FollowsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    account = User.find(params[:account_id])
    current_user.follow!(account)
    redirect_to account_path(account)
  end
end
