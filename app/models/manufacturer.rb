class Manufacturer < ActiveRecord::Base
  attr_accessible :content, :logo, :title, :remote_logo_url

  has_many :products

  mount_uploader :logo, LogoUploader
end
