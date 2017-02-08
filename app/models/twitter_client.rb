class TwitterClient
  def self.search_user(username, count=25)
    TwitterAPI.search("from:#{username}", result_type: "recent").take(count).collect
  end
end
