class AVFilesController < ApplicationController


  def show
    s3 = Aws::S3::Resource.new(region: 'eu-west-2')

    bucket = s3.bucket('redmeeple-ssstorage')

    bucket.objects.limit(50).each do |item|
      puts "Name:  #{item.key}"
      # puts "URL:   #{item.presigned_url(:get)}"
    end
  end


end
