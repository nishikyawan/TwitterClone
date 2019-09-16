class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @blog = Blog.new
    @blogs = Blog.all.order(id: "DESC")
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to new_blog_path, notice: "ツイートしました！"
    else
      render :confirm
    end
  end

  def edit
  end

  def update
    if @content.update(blog_params)
      redirect_to new_blog_path, notice: "ツイートを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @content.destroy
    redirect_to new_blog_path
  end

  def confirm
    @blog = Blog.new(blog_params)
  end

  private

  def blog_params
    params.require(:blog).permit(:content, :created_at, :updated_at)
  end

  def set_blog
    @content = Blog.find(params[:id])
  end
end
