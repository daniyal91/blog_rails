class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	#mount_uploader :post_image, AvatarUploader
end
