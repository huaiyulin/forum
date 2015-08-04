class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_group, only:[:edit, :update, :destroy]
	before_action :set_post, only:[:edit, :update, :destroy]

	def new
		@group = Group.find(params[:group_id])
		@post = @group.posts.new
		# @post = @group.posts.build
	end
	
	def edit
	end
	
	def create
		@group = Group.find(params[:group_id])
		@post = @group.posts.new(post_params)
		@post.author = current_user
		if @post.save
			redirect_to @group, notice: 'Post was successfully created.'
		else
			render @group
		end
	end

	def update
		@post.update
		if @post.save
			redirect_to @group, notice: 'Post was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		if @post.destroy
			redirect_to @group, alert: 'Post was successfully destroyed.'
		else
			render @group
		end
	end

	private

	
	def set_group
		@group = Group.find(params[:group_id])
	end

	def set_post
		@post = current_user.posts.find(params[:id])
	end

	def post_params
		# params.require(@post).permit(:title, :description)
		params.require(:post).permit(:content)
	end
end
