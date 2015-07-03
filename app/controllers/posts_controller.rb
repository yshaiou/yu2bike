class PostsController < ApplicationController
  #for authencation display users will ahve to login to see content or comments
  before_action :authenticate_user!, except: [:index, :show]

  def index
  	#this will show posts in DESC order in the index page
  	@posts = Post.all.order('created_at DESC')

  	#this will show limited nunber of post in DESC order in the index page
  	#@posts = Post.find(params[:id], :id => 2, :order => 'created_at DESC')
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	#find a post, creat a post
  	@post = Post.new(post_params)

  	if @post.save
  		redirect_to @post
  	else
  		# redirect /post/new 
  		render 'new'
  	end
  end

  def edit
  	#edit a post
  	@post = Post.find(params[:id])
  end

  def update
  	#update a post
  	@post = Post.find(params[:id])

  	if @post.update(params[:post].permit(:title, :body))
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@post = Post.find(params[:id])

  	@post.destroy

  	redirect_to root_path
  end

  private

  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
