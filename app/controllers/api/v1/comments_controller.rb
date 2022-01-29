module Api
  module V1
    class CommentsController < Api::V1::ApplicationController
      before_action :find_post, :find_user, :authenticate_user!
      # ALLOWED_DATA = %[text].freeze

      def index
        @comments = find_post.comments.includes(:user)
      end

      def create
        # data = json_payload.select {|k| ALLOWED_DATA.include?(k)}
        # puts "output: #{data}"
        puts "output: #{comments_params}"
        # post = Post.find(params[:post_id])
        # comment = current_user.comments.new(comments_params)
        # comment.post = post
        comment = Comment.new(comments_params)
        comment.post_id = params[:post_id]
        comment.user = current_user
        # if comment.save
        #   render json: comment
        # else 
        #   render json: {"error": "You could not create a comment for this post"}
        # end
        # comment.save!
        # render json: comment

        if comment.save
          render json: { status: 201, message: 'Comment created successfully!', content: { comment: comment } }
        else
          render json: comment.errors, status: :bad_request, message: 'Operation failed'
        end
      end

      private

      def find_user
        User.find(params[:user_id])
      end

      def find_post
        post = find_user.posts.find(params[:post_id])
      end

      def comments_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
