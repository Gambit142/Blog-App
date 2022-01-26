class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.find(params[:id])
    comment = current_user.comments.new(comments_params)
    comment.post = post
    if comment.save
      flash[:success] = 'Successfully commented on this post'
      redirect_to user_post_url
    else
      flash.now[:error] = 'Error: You could not comment on this post'
      render user_post_path
    end
  end

  def delete
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:success] = 'You deleted this comment'

    redirect_to user_post_path(post.user_id, post.id)
  end

  private

  def comments_params
    params.require(:add_comment).permit(:text)
  end
end
