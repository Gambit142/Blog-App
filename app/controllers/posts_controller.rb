class PostsController < ApplicationController
  load_and_authorize_resource
  def find_user
    @user = User.find(params[:user_id])
  end

  def index
    @posts = find_user.posts.includes(:comments)
  end

  def show
    @post = find_user.posts.includes(comments: [:user]).find(params[:id])
  end

  def new
    post = current_user.posts.new
    render :new, locals: { post: post }
  end

  def create
    new_post = current_user.posts.new(post_params)
    new_post.comments_counter = 0
    new_post.likes_counters = 0
    respond_to do |format|
      format.html do
        if new_post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new, locals: { post: new_post }
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'You deleted this post'
    redirect_to user_posts_url
  end

  private

  def post_params
    params.require(:add_post).permit(:title, :text)
  end
end
