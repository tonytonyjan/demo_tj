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

  # delete relationship is not yet
  # 2015.7.1
  def destroy
    #relevant_posts = @tag.posts
    #post_tag_ships = PostTagship.where(:post_id => relevant_posts)
    #post_tag_ships.destroy
    @tag.destroy
    redirect_to tags_path
  end

  def posts_of_this_tag
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts
    render :posts_of_this_tag
  end

  protected

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
