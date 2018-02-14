require 'aws-sdk-sns'

module Messaging
  class Client

    # @param key [String]
    # @param data [Hash]
    def self.post_message(key,data={})
      publish_to_sns(key,data)
    end
    
    def self.publish_to_sns(key,data)
      sns = Aws::SNS::Resource.new(
        region: 'us-east-1',
        access_key_id: SNS_KEY_ID,
        secret_access_key: SNS_SECRET_ACCESS_KEY
      )
      topic_arn = sns.topics.select{|t| t.arn.match(/([^:]*)$/)[0] == key.to_s }.first.try(:arn)
      topic = sns.topic(topic_arn)
      
      msg = { message: data.to_json }
      if data['account_name']
        msg[:message_attributes] = {
          account_name: {
            data_type: 'String',
            string_value: data['account_name']
          }
        }
      end
      
      topic.publish(msg)
    end

  end
end