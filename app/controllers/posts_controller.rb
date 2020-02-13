class PostsController < ApplicationController
  
  before_action :set_target_post, only: %i[show edit update destroy]
  
  
  def index
    @posts = Post.all.page(params[:page]).per(8)
  end
  
  def new
    @post = Post.new(flash[:post])
  end

  def create
    post = Post.new(post_params)

    if post.save
      flash[:success] = '投稿が送信されました'
      redirect_to post
    else
      redirect_to new_post_path, flash: {
        post: post,
        error.messages: poat.error.full_messages
      }
    end
    
  end
  
  
  def show
  end

  def edit
  end

  def update
    @post.update(post_params)

    redirect_to @post
  end

  def destroy
    @post.destroy
    flash[:success] = '投稿は正常に削除されました'

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :body)
  end

  def set_target_post
    @post = Post.find(params[:id])
  end 
end
