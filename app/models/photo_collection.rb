class PhotoCollection < ActiveRecord::Base
	include Tokenable
	validates :name, presence: true
	belongs_to :user
	attr_accessible :name, :description, :attachments_attributes
	has_many :attachments, :as => :attachable, :dependent => :destroy
  	accepts_nested_attributes_for :attachments
end
