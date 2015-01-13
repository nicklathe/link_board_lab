class SiteController < ApplicationController

  before_action :is_authenticated?

  def index
    @user = current_user
    @post = Post.where(session[:user_id])
    # @post = Post.where(current_user.id)
  end

end