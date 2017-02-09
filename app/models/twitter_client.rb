require 'ostruct'

class TwitterClient
  def self.search_user(username, count=25)
    stored_tweets = $redis.get(username)

    if stored_tweets
      tweets = JSON.parse(stored_tweets).map{ |t| OpenStruct.new(t) }
    else
      tweets = TwitterAPI.search("from:#{username}", result_type: "recent").take(count).collect
      $redis.setex(username, 300, @tweets.to_json)
    end
    tweets
  end
end
