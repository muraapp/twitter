class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
    @tweets = Tweet.order(:created_at).reverse_order
    
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
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
  
  def confirm
    @tweets = Tweet.all
    @tweet = Tweet.new(tweets_params)
    render :index if @tweet.invalid?
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
      
end
