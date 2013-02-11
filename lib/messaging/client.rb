module Messaging
  class Client

    # @param key_name [String]
    # @param url [String]
    # @param secret_key [String]
    def self.subscribe_to(key_name,url,secret_key="")

    end

    # @param key_name [String]
    def self.unsubscribe_from(key_name)

    end

    # @param key [String]
    # @param data [Hash]
    def self.post_message(key,data={})
      m = Message.new(key_name: key, data: data.to_json)
      m.create
    end

  end
end