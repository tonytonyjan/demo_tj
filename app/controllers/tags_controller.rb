class TagsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new tag_params
    if @tag.save
      redirect_to @tag
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

  protected

  def tag_params
    params.require(:tag).permit(:name)
  end

end
