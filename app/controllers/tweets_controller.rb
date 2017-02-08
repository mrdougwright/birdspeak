class TweetsController < EndUserController

  def create
    redirect_to tweets_from_path(tweets_params[:username])
  end

  def show
    @tweets = GetTweets.from_user(tweets_params[:username])
  end

private

  def tweets_params
    params.permit(:username)
  end
end
