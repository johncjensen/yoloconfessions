class CategoryController < ApplicationController

  def nightclub
      @posts = Post.where(category: "nightclub").reverse
  end

  def general
      @posts = Post.where(category: "general").reverse
  end

  def workplace
      @posts = Post.where(category: "workplace").reverse
  end

  def school
      @posts = Post.where(category: "school").reverse
  end

  def relationships
      @posts = Post.where(category: "relationships").reverse
  end

  def hookups
      @posts = Post.where(category: "hookups").reverse
  end

end
