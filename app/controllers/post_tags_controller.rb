class PostTagsController < ApplicationController

  before_action :find_post, :only => [ :show, :new, :create ]

  def index
  end

  def show
  end

  def new
    @tag = @post.tags.new
  end

  def create
    @tag = @post.tags.create tag_params
    if @tag.save
      flash[:notice] = "新增標籤成功 #{@tag.name}"
      redirect_to @post
    else
      flash[:alert] = "新增標籤失敗"
      render :new
    end
  end

  def edit
  end

  def update
  end

  #def posts_of_this_tag
  #  @tag = Tag.find(params[:format])
  #  @posts = @tag.posts
  #  render :tagposts
  #end

  protected

  def find_post
    @post = Post.find(params[:post_id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
