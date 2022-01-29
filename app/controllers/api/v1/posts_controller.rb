module Api
  module V1
    class PostsController < Api::V1::ApplicationController
      before_action :find_user

      def index
        @posts = find_user.posts.includes(:comments, :user)
      end

      private

      def find_user
        User.find(params[:user_id])
      end
    end
  end
end
