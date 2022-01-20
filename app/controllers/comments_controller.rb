class CommentsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:id])
    comment = current_user.comments.new(comments_params)
    comment.post = post
    comment.save
    if comment.save
      flash[:success] = "Successfully commented on this post"
      redirect_to user_posts_url
    else
      flash.now[:error] = "Error: Post could not be created"
      render user_posts_path
    end
  end

  private

  def comments_params
    params.require(:add_comment).permit(:text)
  end
end
