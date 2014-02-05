class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :only_show_pubished, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.page(params[:page]).where(visible: true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.js
    end
  end


  # def index
  #   @posts = Post.page(params[:page])
  #   # @posts = @posts.paginate(:page => params[:page], :per_page => 15)
  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end

  # def index
  #   @posts = Post.where(visible: true).paginate(:page => params[:page]).reverse
  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if verify_recaptcha(:model => @post, :message => "Oh! It's error with reCAPTCHA!") && @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def only_show_pubished
      if current_user
      elsif @post.visible == false
        redirect_to root_path
      end
    end

    def post_params
      params.require(:post).permit(:title, :body, :visible, :category)
    end
end
