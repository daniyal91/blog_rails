ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Welcome Admin #{current_user.full_name}"
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

    columns do
      column do
        panel "New Posts (Published)" do
          ul do
            Post.where('published = ?', true).last(5).map do |post|
              li link_to(post.title, admin_post_path(post)) + " by " + link_to(post.user.full_name, admin_user_path(post.user.id))
            end
          end
        end
      end
      column do
        panel "Unpublished Posts" do
          ul do
            Post.where('published = ?', false).map do |post|
              li link_to(post.title, admin_post_path(post)) + " by " + link_to(post.user.full_name, admin_user_path(post.user.id))
            end
          end
        end
      end
    end

    columns do
      column do
        panel "New Signed-Up Users" do
          ul do
            User.where('admin = ?',false).last(5).map do |user|
              li link_to(user.full_name, admin_user_path(user)) + " on " + user.created_at.strftime("%B %d, %Y") + " at " + user.created_at.strftime("%I:%M:%S %p")
            end
          end
        end
      end
      column do
        panel "Recently Logged-In Users" do
          ul do
            User.all.order("current_sign_in_at DESC").last(5).map do |user|
              li link_to(user.full_name, admin_user_path(user)) + " from " + user.current_sign_in_ip
            end
          end
        end
      end
    end

  end # content
end
