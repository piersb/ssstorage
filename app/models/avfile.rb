class AVFile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :file, presence: true

  attr_accessor :file


  def create
    s3reference = title.parameterize
    bucket = AmazonInterface.bucket

    object = bucket.object(s3reference)
    object.upload_file(file.absolute_path)
  end


end
