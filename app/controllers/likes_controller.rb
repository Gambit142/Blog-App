class LikesController < ApplicationController
  def create
    post = Post.find(params[:id])
    user_like = current_user.likes.new(post: post)
    if user_like.save
      flash[:success] = 'You liked this post'
      redirect_to user_post_url
    else
      flash.now[:error] = 'Error: You could not like this post'
      render user_post_path
    end
  end
end
