class AdminController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.paginate(:page => params[:page]).where(visible: false)
  end

end
