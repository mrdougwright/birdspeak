require 'ostruct'

class TweetsController < EndUserController

  def create
    redirect_to tweets_from_path(tweets_params[:username])
  end

  def show
    twitter_handle = tweets_params[:username]
    stored_tweets  = $redis.get(twitter_handle)

    if stored_tweets
      tweets = JSON.parse(stored_tweets)
      @tweets = tweets.map{ |t| OpenStruct.new(t) }
    else
      @tweets = TwitterClient.search_user(twitter_handle)
      $redis.set(twitter_handle, @tweets.to_json)
    end
  end

private

  def tweets_params
    params.permit(:username)
  end
end
