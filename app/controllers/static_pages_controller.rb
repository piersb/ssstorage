class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @user = current_user
      @avfile = current_user.avfiles.build
      @avfiles = current_user.avfiles
    end
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
