class AVFile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true


  attr_accessor :file

  def create
    s3reference = title.parameterize
    bucket = AmazonInterface.bucket

    object = bucket.object(s3reference)
    logger.info '>>> boo'
    logger.debug '>>> hello it is i'
    logger.debug file
    thing = object.put(body: file.tempfile)
    logger.debug thing

    self.update(s3reference: s3reference)
  end


  private




end
