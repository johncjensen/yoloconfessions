class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :only_show_pubished, only: [:show, :edit, :update, :destroy]
  before_action :setup_negative_captcha, :only => [:new, :create]


  def index
    @posts = Post.page(params[:page]).where(visible: true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
      format.js
    end
  end

  def thanks
  end

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
    if @captcha.valid? && @post.save
      format.html { redirect_to thanks_path, notice: 'Thanks for your submission!' }
      format.json { render action: 'show', status: :created, location: @post }
    else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        # format.html { render action: 'new' }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
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
      @post = Post.friendly.find(params[:id])
    end

    def only_show_pubished
      if current_user
      elsif @post.visible == false
        redirect_to root_path
      end
    end

    def post_params
      params.require(:post).permit(:visible, :category).merge(@captcha.values)
    end

    def setup_negative_captcha
      @captcha = NegativeCaptcha.new(
        # A secret key entered in environment.rb. 'rake secret' will give you a good one.
        secret: "f4184a12c35295acd9fb93860bbb4759a209083592769d2d348e20eb693399732c19dab8de2739f95b878f6d69f751125cb0a14ec72ae56602b583e89374d16d",
        spinner: request.remote_ip,
        # Whatever fields are in your form
        fields: [:category, :title, :body],
        params: params
      )
    end

end
