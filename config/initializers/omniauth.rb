OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '289674577850267', '0be24adffdc7221918ab8ba1ce754c4d'
end