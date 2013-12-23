class UsersController < ApplicationController

  def new
    #@user = User.new

   if current_user
        redirect_to buddies_path
    else
        @user = User.new
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @tweet = Tweet.new
    @relationship = Relationship.where(follower_id: current_user.id,followed_id: @user.id).first_or_initialize if current_user
    
  end

  def index
    @users = User.all
    
  end

  def buddies
    if current_user
        @tweet = Tweet.new
        buddies_ids = current_user.followeds.map(&:id).push(current_user.id)
        @tweets = Tweet.find_all_by_user_id buddies_ids
    else
        redirect_to root_url
    end
  end

end
