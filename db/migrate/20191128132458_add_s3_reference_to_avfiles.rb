class AddS3ReferenceToAVFiles < ActiveRecord::Migration[5.2]
  def change
    add_column :avfiles, :s3reference, :string
  end
end
