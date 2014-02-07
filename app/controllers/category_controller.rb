class CategoryController < ApplicationController

  def nightclub
    @nightclubposts = Post.page(params[:page]).where(category: "nightclub").where(visible: true).order('created_at DESC')
  end

  def general
    @generalposts = Post.page(params[:page]).where(category: "general").where(visible: true).order('created_at DESC')
  end

  def school
    @schoolposts = Post.page(params[:page]).where(category: "school").where(visible: true).order('created_at DESC')
  end

  def workplace
    @workplaceposts = Post.page(params[:page]).where(category: "workplace").where(visible: true).order('created_at DESC')
  end

  def relationships
    @relationshipsposts = Post.page(params[:page]).where(category: "relationships").where(visible: true).order('created_at DESC')
  end

  def hookups
    @hookupsposts = Post.page(params[:page]).where(category: "hookups").where(visible: true).order('created_at DESC')
  end

end
