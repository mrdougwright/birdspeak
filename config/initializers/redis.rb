redisStore = Rails.env.production? ? ENV['REDIS_URL'] : 'redis://localhost:6379/0/cache'
$redis = Redis.new(url: redisStore)
