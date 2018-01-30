module SnsHelper
  def sns_verified?
    # TODO https://docs.aws.amazon.com/sns/latest/dg/SendMessageToHttp.verify.signature.html
    return true 
  end
  
  def sns_message
    @sns_message ||= ActiveSupport::JSON.decode(sns_data[:Message]).symbolize_keys!
  end
  
  # topic, without all the ARN
  def sns_topic
    sns_data[:TopicArn].match(/([^:]*)$/)[0]
  end
  
  def sns_type
    request.headers['x-amz-sns-message-type']
  end
  
  def sns_notification_id
    request.headers['x-amz-sns-message-id']
  end
  
  def sns_data
    @sns_data ||= ActiveSupport::JSON.decode(request.body).symbolize_keys!
  end
  
  def sns_message_id
    sns_data[:MessageId]
  end
  
  def sns_set_as_received!
    Rails.cache.write(sns_message_id, true, expires_in: 2.minutes)
  end
  
  def sns_duplicate_submission?
    Rails.cache.read(sns_message_id)
  end
end