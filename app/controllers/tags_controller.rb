class TagsController < ApplicationController

  before_action :find_tag, :only => [ :show, :edit, :update, :destroy ]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      flash[:notice] = "新增標籤成功"
      redirect_to tags_path
    else
      flash[:alert] = "新增標籤失敗"
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update tag_params
      flash[:notice] = "編輯標籤成功"
      redirect_to tag_posts_path(@tag)
    else
      flash[:alert] = "編輯標籤失敗"
      render :edit
    end
  end

  def destroy
    PostTagship.where(:tag_id => @tag).delete_all
    @tag.destroy
    flash[:notice] = "刪除標籤成功"
    redirect_to tags_path
  end

  def posts_of_this_tag
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts
    render :posts_of_this_tag
  end

  def hot_tag

  end

  protected

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
