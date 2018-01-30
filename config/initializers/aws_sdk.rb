Aws.config.update({
   credentials: Aws::Credentials.new(
       Messaging::SNS_KEY_ID,
       Messaging::SNS_SECRET_ACCESS_KEY
    )
})