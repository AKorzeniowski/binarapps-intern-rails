class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(post_id: @post.id)
  end

  def new
    @post = Post.new 
  end

  def create 
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post was created'
    else
      render :new
    end
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def update 
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post was updated'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to posts_path, notice: 'Post was destroyed'
    else
      redirect_to posts_path, alert: 'Post could not be destroyed'
    end
  end

  private 

  def post_params
    params.require(:post).permit(:title, :content, :author_id)
  end
end
