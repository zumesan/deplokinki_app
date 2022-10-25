class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/deplos/#{comment.deplo.id}"
  end

  def destroy
    deplo = Deplo.find(params[:deplo_id])
    comment = deplo.comments.find(params[:id])
    if current_user == comment.user #コメントの投稿者以外のアクションへのアクセスを制限
      comment.destroy
      redirect_to "/deplos/#{comment.deplo.id}"
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content).merge(user_id: current_user.id, deplo_id: params[:deplo_id])
  end

end
