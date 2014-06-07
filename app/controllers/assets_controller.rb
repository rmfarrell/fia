class AssetsController < ApplicationController

  def index
     @assets = Asset.all
  end
  
  def show
    @asset = Asset.find(params[:id])
  end
  
  def new
    redirect_to '/'
  end
  
  def edit
    redirect_to '/'
  end
  
  def destroy
    redirect_to '/'
  end
end
