ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :avatar, :email

  scope :normal, :default => true do |user|
    user.where(:admin => false)
  end

  scope :admin do |user|
    user.where(:admin => true)
  end

  index do
    column :first_name
    column :last_name
    column :email
    column "Image" do |u|
      image_tag(u.avatar, size: "80x60")
    end
    column :admin
    actions defaults: false do |user|
      link_to "View", admin_user_path(user)
    end
    actions defaults: false do |user|
      link_to "Edit", edit_admin_user_path(user)
    end
    actions defaults: false do |user|
      unless user.admin?
        link_to "Delete", admin_user_path(user), :method => :delete
      end
    end
  end

  sidebar "Unpublished posts for this user", :only => :show do
    ul do
      Post.where('published = ? AND user_id = ?', false, params[:id]).map do |post|
        li link_to(post.title, admin_post_path(post))
      end
    end
  end

end