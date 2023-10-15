class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  def show; end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.edited', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_edited', item: User.model_name.human)
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :avatar, :avatar_cache)
  end
end
