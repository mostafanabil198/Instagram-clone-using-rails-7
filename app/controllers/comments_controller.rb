class CommentsController < ApplicationController
  before_action :set_post
  def create 
    @comment = @post.comments.create(user: current_user, body: params[:comment_body])
  end

  def destroy 
    @comment = Comment.find(params[:id])
    if(@comment.user == current_user)
      @comment.destroy
    end
  end

  private
  def set_post 
    @post = Post.find(params[:post_id])
  end
end