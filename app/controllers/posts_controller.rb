class PostsController < ApplicationController

  def index
  end

  def new
    @pot = Post.new 
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      rennder :new
    end
    
  end
end
