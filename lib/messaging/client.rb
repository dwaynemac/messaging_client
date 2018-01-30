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
      publish_to_sns(key,data)
      
      m = Message.new(key_name: key, data: data.to_json)
      m.create
    end
    
    def self.publish_to_sns(key,data)
      sns = Aws::SNS::Resource.new(region: 'us-east-1')
      topic_arn = sns.topics.select{|t| t.arn.match(/([^:]*)$/)[0] == key.to_s }.first
      topic = sns.topic(topic_arn)
      topic.publish({ message: data.to_json })
    end

  end
end