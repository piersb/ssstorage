class CreateAVFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :av_files do |t|
      t.text :title
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :av_files [:user_id, :created_at]
  end
end
