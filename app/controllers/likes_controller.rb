class LikesController < ApplicationController
  before_action :set_post

  def toggle_like
    if(@like = @post.likes.find_by(user: current_user))
      @like.destroy
    else
      @post.likes.create(user: current_user)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "post#{@post.id}actions",
          partial: "posts/post_actions",
          locals: {post: @post}
        )
      end
    end
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end