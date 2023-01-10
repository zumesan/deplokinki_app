class Admin::CommentsController < ApplicationController

  def destroy
    deplo = Deplo.find(params[:deplo_id])
    comment = deplo.comments.find(params[:id])
    if current_user.admin?
      comment.destroy
      redirect_to "/deplos/#{comment.deplo.id}"
    else
      redirect_to root_path
    end
  end

end
