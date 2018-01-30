Aws.config.update({
   credentials: Aws::Credentials.new(
       SNS_KEY_ID,
       SNS_SECRET_ACCESS_KEY
    )
})