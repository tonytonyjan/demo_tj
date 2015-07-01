class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def posts_of_this_tag
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts
    render :posts_of_this_tag
  end

  protected

  def tag_params
    params.require(:tag).permit(:name)
  end

end
