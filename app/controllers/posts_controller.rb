class PostsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_target_post, only: %i[show edit update destroy]
  before_action :validate_user, only: %i[edit update destroy]

  #簡単ログイン機能
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def index
    @posts = Post.all.page(params[:page]).per(8).order(id: "DESC")
  end
  
  def new
    @post = Post.new(flash[:post])
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      flash[:success] = '投稿が送信されました'
      redirect_to post
    else
      redirect_to new_post_path, flash: {
        post: post,
        error_messages: post.errors.full_messages
      }
    end
    
  end
  
  
  def show
    @comment = Comment.new(post_id: @post.id )
    @comment = @post.comments.new
    
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.update(post_params)
      redirect_to @post
    else
      redirect_to edit_post_path, flash: {
        post: @post,
        error_messages: @post.errors.full_messages
      }
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '投稿は正常に削除されました'

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :body, :image)
  end

  def set_target_post
    @post = Post.find(params[:id])
  end 

  def validate_user
    if @post.user != current_user
      redirect_to root_path, alert: 'この機能はログインしないと利用できません'
    end
  end
end

