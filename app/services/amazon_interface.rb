class AmazonInterface

  # syntactic sugar; no need to call .new.bucket when you can just call .bucket
  def self.bucket(*args, &block)
    new(*args, &block).bucket
  end

  def bucket
    credentials = Aws::Credentials.new(ENV['S3_ACCESS_KEY'], ENV['S3_SECRET_KEY'])
    s3 = Aws::S3::Resource.new(region: 'eu-west-2', credentials: credentials)
    s3.bucket('redmeeple-ssstorage')
  end

end
