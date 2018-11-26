Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :facebook, '251179232216995','64cb3392176dabc5294449f2ff74c704'
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  end