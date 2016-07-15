class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
    redirect_to tweets_path, notice: "投稿しました！"
    else
      render action: 'index'
    end
  end
  
  def edit
  end
  
  def update
    @tweet.update(tweets_params)
    redirect_to tweets_path, notice: "投稿を更新しました！"
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "投稿を削除しました！"
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
      
end
