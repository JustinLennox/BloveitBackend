OmniAuth.config.logger = Rails.logger

#This baby right here uses the Facebook App ID and Secret found on the facebook
#page. The ID is 881886568566728, and the secret is 99b637633339cdec158aff53f4e3a9f7
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 881886568566728, 99b637633339cdec158aff53f4e3a9f7
end