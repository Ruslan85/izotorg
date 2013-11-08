class Product < ActiveRecord::Base
  attr_accessible :content, :image, :manufacturer_id, :title, :remote_image_url

  belongs_to :manufacturer

  mount_uploader :image, ImageUploader
end
