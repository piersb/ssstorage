class AVFile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  validates :s3reference, presence: true


  def create
    s3reference = title.parameterize
    bucket = AmazonInterface.bucket

    object = bucket.object(s3reference)
    object.upload_file(file.absolute_path)

    self.update(s3reference: s3reference)
  end


end
