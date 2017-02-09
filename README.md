# Bird Speak

This app allows users to read the latest 25 tweets, up to 7 days ago, from any twitter handle.

### App Design Choices
For user authentication, Devise is a no brainer. It's the goto for quick and reliable authentication. For styling, I chose Tachyons because it is also quick, lightweight and prevents me from having to write extra css. For ENV variables, I chose to use dotenv, which allows you to store secret vars in one file.

For the application logic, I started at first putting small modules (like Utils and Twitter API) into the lib directory. I like this approach because it's sort of a functional style and it allows for easy unit testing. However, I moved these modules into their own classes, because it was easier to config with Heroku. I also added Redis caching to this class. I could have added basic Rails caching, but I thought it would be fun to spin up a quick Redis db. And finally I added a few mini tests.

### Setup Instructions
- Git clone the repo and cd into the directory.
- See Doug for the secret .env file and add it to the root of this project. Alternatively, create your own Twitter Dev App (https://apps.twitter.com/) and enter the corresponding values to these four keys:

    ```
    TWITTER_CONSUMER_KEY="Your value here, and the others below"
    TWITTER_CONSUMER_SECRET=
    TWITTER_ACCESS_TOKEN=
    TWITTER_ACCESS_SECRET=
    ```

- You will also need a Redis & Postgres server running

    ```
    $ brew install redis
    $ redis-server /usr/local/etc/redis.conf
    $ pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
    ```

- Run `$ bundle`
- Run `rake db:migrate`
- Run `rails s` to start up the server on localhost:3000


### Test Suite Instructions
 - Run `$ rake db:test:prepare`
 - Run `$ rake test`
