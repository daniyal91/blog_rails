ActiveAdmin.register Comment, :as => "Posts Comment" do
  permit_params :content, :user_id, :post_id

  index do
    column :content
    column "Post" do |u|
    	link_to(u.post.title, "/admin/posts/#{u.post.id}")
    end
    column "User" do |u|
    	link_to(u.user.full_name, "/admin/users/#{u.user.id}")
    end
    actions
  end

end

