class TweetsController < ApplicationController

def create
  @tweet = Tweet.new(params[:tweet])
  @tweet.user_id = current_user.id
 
  if @tweet.save
      redirect_to current_user
  else
      flash[:error] = "Problem!"
      redirect_to current_user
  end
end

def index
    @tweets = Tweet.all include: :user
    @tweet = Tweet.new
end



end
