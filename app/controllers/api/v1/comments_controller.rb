module Api
  module V1
    class CommentsController < Api::V1::ApplicationController
      before_action :authenticate_user!
      # ALLOWED_DATA = %[text].freeze

      def index
        @comments = find_post.comments.includes(:user)
      end

      def create
        @comment = Comment.new(comments_params)
        @comment.post_id = params[:post_id]
        @comment.user_id = current_user.id

        if @comment.save
          render json: { status: 201, message: 'Comment created successfully!', content: { comment: @comment } }
        else
          render json: @comment.errors, status: :bad_request, message: 'Operation failed'
        end
      end

      private

      # def find_user
      #   User.find(params[:user_id])
      # end

      # def find_post
      #   find_user.posts.find(params[:post_id])
      #   # post
      # end

      def comments_params
        params.permit(:text)
      end
    end
  end
end
