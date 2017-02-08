class UsersController < EndUserController
  def show
    @user = User.find(params[:id])
    @tweets = GetTweets.from_user('mrdougwright')
  end
end
