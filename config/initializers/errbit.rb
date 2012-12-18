Airbrake.configure do |config|
  config.api_key = 'df7a03388a2eefcc5247bb5fbb1b0c72'
  config.host    = 'charpaye-exceptions.herokuapp.com'
  config.port    = 443
  config.secure  = config.port == 443
end
