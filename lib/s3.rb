module S3
  def s3
    credentials = Aws::Credentials.new(ENV['S3_ACCESS_KEY'], ENV['S3_SECRET_KEY'])
    s3 = Aws::S3::Resource.new(region: 'eu-west-2', credentials: credentials)
    return s3.bucket('redmeeple-ssstorage')
  end
end
