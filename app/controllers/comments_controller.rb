class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)

		flash[:notice] = "You roll"
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		flash[:notice] = "You Got Rid Of It"
		redirect_to post_path(@post)
	end

	private
	#def find_post
		#@post = Post.find(params[:id])
		
	#end
	def comment_params
		params.require(:comment).permit(:name, :body)
		
	end
end
