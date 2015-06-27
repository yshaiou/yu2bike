class PostsController < ApplicationController
  def index
  	#this will show posts in DESC order in the index page
  	@posts = Post.all.order('created_at DESC')
  end


  def show
  	@post = Post.find(params[:id])
  end

  def new
  end

  def create
  	#find a post, creat a post
  	@post = Post.new(post_params)

  	@post.save
  	redirect_to @post
  end

  private

  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
