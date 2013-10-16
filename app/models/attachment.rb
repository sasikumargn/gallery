class Attachment < ActiveRecord::Base
  attr_accessible :name, :file, :remote_file_url, :file_cache

  belongs_to :attachable, :polymorphic => true
  mount_uploader :file, FileUploader
end
