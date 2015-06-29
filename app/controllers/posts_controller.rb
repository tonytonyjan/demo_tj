class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new title: params[:title], content: params[:content]
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def new
  end

  def edit
  end
end
