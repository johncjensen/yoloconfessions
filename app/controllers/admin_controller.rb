class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.where(visible: false)
  end
end
