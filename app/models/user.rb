class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  #setup accessible attribute for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :photo_collections

end
