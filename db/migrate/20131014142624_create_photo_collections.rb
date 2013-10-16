class CreatePhotoCollections < ActiveRecord::Migration
  def change
    create_table :photo_collections do |t|
      t.string :name
      t.text :description
      t.string :token
      t.integer :user_id
      t.timestamps
    end
  end
end
