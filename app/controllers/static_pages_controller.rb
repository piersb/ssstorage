class StaticPagesController < ApplicationController

  def home
    bucket = AmazonInterface.new.bucket
    @s3files = bucket.objects.limit(50)
  end

  def help
  end

  def about
  end

  def contact
  end

end
