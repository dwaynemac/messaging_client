module Messaging
  class Message < LogicalModel
    self.hydra = HYDRA
    self.resource_path = "/v0/messages"
    self.attribute_keys =
        [
            :key_name,
            :data
        ]
    self.use_api_key = true
    self.api_key_name = "app_key"
    self.api_key = KEY
    self.host  = HOST

    def json_root
      'message'
    end

    def self.paginate()
      raise 'Not Implemented In Service'
    end

    def destroy()
      raise 'Not Implemented In Service'
    end

    def update()
      raise 'Not Implemented In Service'
    end

  end
end