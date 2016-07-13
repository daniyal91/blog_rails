ActiveAdmin.register Post do
  permit_params :title, :content, :user_id, :post_image, :published

  index do
    column :title
    column :content
    column "User" do |u|
    	link_to(u.user.full_name, "/admin/users/#{u.user.id}")
    end
    column "Image" do |u|
      image_tag(u.post_image, size: "80x60")
    end
    column :published
    actions
  end

end