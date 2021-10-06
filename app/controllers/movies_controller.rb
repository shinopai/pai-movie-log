class MoviesController < ApplicationController
  before_action :authenticate_user!
  # before_action :find_user
  # before_action :find_movie
  
  def create
    @user = User.find(params[:user_id]) 
    @movie = @user.movies.new(movie_params)
    @movies = @user.movies.page(params[:page]).per(10)

    if @movie.save 
      redirect_to user_path(@user)
    else 
      render 'users/show'
    end
  end

  def edit 
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:id])
    
    if @movie.update(movie_params)
      redirect_to user_path(@user)
    else 
      render 'movies/edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:id])
    
    @movie.delete 

    redirect_to user_path(@user)
  end



  # private 
  def movie_params 
    params.require(:movie).permit(:time, :memo, :image)
  end

  private 
    :movie_params
end
