ActiveAdmin.register Post do
  permit_params :title, :content, :user_id, :post_image, :published

  scope :published, :default => true do |posts|
    posts.where(:published => true)
  end

  scope :unpublished do |posts|
    posts.where(:published => false)
  end

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
    actions defaults: true do |post|
      if post.published == false
        link_to('Publish', "/admin/posts/#{post.id}/publish_post", :method => :put)
      else
        link_to('Un-publish', "/admin/posts/#{post.id}/unpublish_post", :method => :put)
      end
    end
  end

  action_item only: :show do
    if post.published == false
      link_to('Publish Post', "/admin/posts/#{post.id}/publish_post", :method => :put)
    else
      link_to('Un-publish Post', "/admin/posts/#{post.id}/unpublish_post", :method => :put)
    end
  end

  controller do

    def publish_post
      @post = Post.find(params[:id])
      @post.published = true
      @post.save
      redirect_to :back
    end

    def unpublish_post
      @post = Post.find(params[:id])
      @post.published = false
      @post.save
      redirect_to :back
    end

  end

end