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
    @tag = @post.tags.new tag_params
    if @tag.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  protected

  def find_post
    @post = Post.find(params[:post_id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
