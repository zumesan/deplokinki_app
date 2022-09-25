class DeplolistsController < ApplicationController
  before_action :set_deplo, except: [:index]
  before_action :authenticate_user!, except: [:index]

  def index
  end
  
  private
  def set_deplo
    @deplo = Deplo.find(params[:id])
  end

  def deplo_params
    params.require(:deplo).permit(:deplo_title, :deplo_info, :municipality, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end
end