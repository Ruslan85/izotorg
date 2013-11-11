class Manufacturer < ActiveRecord::Base
  attr_accessible :content, :logo, :title, :remote_logo_url

  has_many :products, dependent: :destroy

  mount_uploader :logo, LogoUploader

   def full_title
  	title
  end
end
