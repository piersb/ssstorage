class StaticPagesController < ApplicationController
  before_action :set_s3_direct_post

  def home
    puts 'this bit working'
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

  private

  def set_s3_direct_post
    @s3_direct_post = AmazonInterface.bucket.presigned_post(
        key: "#{SecureRandom.uuid}/${filename}",
        success_action_status: '201')
    # byebug
  end


end
