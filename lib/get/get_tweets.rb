module GetTweets
  def self.from_user(username, count=25)
    TwitterClient.search("from:#{username}", result_type: "recent").take(count).collect
  end
end
