class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/deplos/#{comment.deplo.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content).merge(user_id: current_user.id, deplo_id: params[:deplo_id])
  end

end
