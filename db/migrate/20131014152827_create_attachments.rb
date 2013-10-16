class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :file
      t.references :attachable, index: true
      t.string :attachable_type
      t.timestamps
    end
  end
end
