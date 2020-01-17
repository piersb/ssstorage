class AVFile < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true
  before_commit :set_s3_direct_post, only: :create

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

    def set_s3_direct_post
      @s3_direct_post = AmazonInterface.bucket.presigned_post(key: "#{SecureRandom.uuid}/${filename}", success_action_status: '201')
    end



end
