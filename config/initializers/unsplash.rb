
Unsplash.configure do |config|
  config.application_access_key = ENV['UNSPLASH_ACCESS_KEY']
  config.application_secret = ENV['UNSPLASH_SECRET_KEY']
  # config.application_redirect_uri = "https://your-application.com/oauth/callback"
  config.utm_source = "app_apero_app"

  # # optional:
  # config.logger = MyCustomLogger.new
end
