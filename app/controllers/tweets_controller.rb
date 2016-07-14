class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end
  
  def create
    Tweet.create(tweets_params)
    redirect_to tweets_path
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
end
