if(defined?(Rails))
  module Messaging

    unless defined? HYDRA
      HYDRA = Typhoeus::Hydra.new
    end

    HOST = case Rails.env
      when "production"
        "padma-messaging.herokuapp.com"
      when "staging"
        "padma-messaging-staging.herokuapp.com"
      when "development"
         "localhost:3011"
      when "test"
         "localhost:3011"
    end
  end
end
