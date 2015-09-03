OmniAuth.config.logger = Rails.logger

#Facebook initializer. Passes the app id (881886568566728) and secret (99b637633339cdec158aff53f4e3a9f7) as STRINGS
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['881886568566728'], ENV['99b637633339cdec158aff53f4e3a9f7']
end
