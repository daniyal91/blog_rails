class AddImageToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :post_image, :json
  end
end
