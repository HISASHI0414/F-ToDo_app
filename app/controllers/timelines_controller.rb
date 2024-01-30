class TimelinesController < ApplicationController
  before_action :authenticate_user! #ログインした人しかできない
  def show
    user_ids = current_user.followings.pluck(:id)
    @boards = Board.where(user_id: user_ids)
  end
end
