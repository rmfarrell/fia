class AssetsController < ApplicationController

  def index
    @assets = Asset.all
  end
  
  def show
    @asset = Asset.find(params[:id])
  end
  
  def create
    @asset = Asset.new(asset_params)
      
    if @asset.save
      redirect_to [:admin, @asset]
    else
      render 'new'
    end
  end
    
  def update
    @asset = Asset.find(params[:id])
      
    if @asset.update(asset_params)
       redirect_to [:admin, @asset]
    else
      render 'edit'
    end
  end
  
  private
    def asset_params
      params.require(:asset).permit(:title, :text)
    end
end
