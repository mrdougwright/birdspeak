require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Birdspeak
  class Application < Rails::Application
    redisStore = Rails.env.production? ? ENV['REDIS_URL'] : 'redis://localhost:6379/0/cache'
    config.cache_store = :redis_store, redisStore, { expires_in: 90.minutes }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
