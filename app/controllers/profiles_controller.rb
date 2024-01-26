class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = current_user.prepare_profile #user.rb (model)にて定義
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to root_path, notice: 'プロフィールを更新しました！'
    else
      flash.now[:error] = 'プロフィールが更新できませんでした。'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :nickname,
      :avatar
    )
  end
end
