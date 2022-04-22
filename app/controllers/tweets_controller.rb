class TweetsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.create(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was scheduled successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  
  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end
end