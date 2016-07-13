ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :avatar, :email
  index do
    column :first_name
    column :last_name
    column :email
    column "Image" do |u|
      image_tag(u.avatar, size: "80x60")
    end
    column :admin
    actions
  end
end