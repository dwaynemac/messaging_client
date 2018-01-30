module Messaging
  class NotifyMe < LogicalModel
    self.hydra = HYDRA
    self.resource_path = "/v0/notify_me"
    self.attribute_keys =
        [
            :secret_key, # secret key to validate notification
            :url,     # url to which notification should be posted
            :key_name # key from wich to receive notifications
        ]
    self.use_api_key = true
    self.api_key_name = "app_key"
    self.api_key = KEY
    self.host  = HOST

    def json_root
      'notify_me'
    end

    def destroy()
      # needs a diferent implementation, there is no ID.
    end

  end
end