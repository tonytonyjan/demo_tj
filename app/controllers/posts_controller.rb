class PostsController < ApplicationController
  
  before_action :find_post, :only => [ :show, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    #@post = Post.new title: params[:title], content: params[:content]
    @post = Post.new post_params
    if @post.save
      flash[:notice] = "新增文章成功"
      redirect_to @post
    else
      flash[:alert] = "新增文章失敗"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      flash[:notice] = "編輯文章成功"
      redirect_to @post
    else
      flash[:alert] = "編輯文章失敗"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  protected

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :tag_ids => [])
  end
  
end
