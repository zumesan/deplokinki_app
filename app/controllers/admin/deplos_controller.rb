class Admin::DeplosController < ApplicationController
  before_action :if_not_admin
  before_action :set_deplo, only: [:show, :edit, :destroy]

  def show
    @comment = Comment.new
    @comments = @deplo
  end

  def edit
  end

  def destroy
    if @deplo.destroy
      redirect_to root_path
    end
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_deplo
    @deplo = Deplo.find(params[:id])
  end

end
