class PostsController < ApplicationController

  before_action :is_authenticated?

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.create(post_params)

    if @post.save
      flash[:sucess] = "Your post has been added"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:link,:user_id)
  end
end