class PostsController < ApplicationController
	before_action :authenticate_user! ,except: [:index, :show, :homepage]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		# puts "================image111111111111111==============="
		# puts params[:post][:title].inspect
		# puts params[:post][:feature_image].original_filename.inspect
		
		

		@post = Post.new(post_params)
		@post.feature_image = params[:post][:feature_image].original_filename

		if(@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		
		@post = Post.find(params[:id])
		
		if(@post.update(post_params))
			if(!params[:post][:feature_image].original_filename.nil?)
				@post.feature_image = params[:post][:feature_image].original_filename
				@post.save
				redirect_to @post
			else
				redirect_to @post
			end	
		else
			render 'edit'
		end	
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title,:body,:category_id)

	end
end
