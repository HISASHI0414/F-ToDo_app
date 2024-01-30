class AccountsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @account = User.find(params[:id])
    if @account == current_user
      redirect_to edit_profile_path
    end
  end
end
