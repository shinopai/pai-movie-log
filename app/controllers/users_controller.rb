class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @movies = @user.movies.order(created_at: 'desc').page(params[:page]).per(10)
    @period = params[:period]
    @chart_movies = @user.movies_period(@period)
  end

  def destroy
    @user = User.find(params[:id])
    @user.movies.destroy_all

    redirect_to edit_user_registration_path, notice: '時間記録をリセットしました'
  end
end
