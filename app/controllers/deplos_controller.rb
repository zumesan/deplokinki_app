class DeplosController < ApplicationController
  def index
  end

  def new
    @deplo = Deplo.new
  end
end
