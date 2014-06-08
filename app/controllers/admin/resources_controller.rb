class Admin::ResourcesController < ApplicationController
  
  def index
    @assets = Resource.all
  end
  
  def edit
    @asset = Resource.find(params[:id])
  end

  def show
    @asset = Resource.find(params[:id])
  end
  
  def update
    @asset = Resource.find(params[:id])
    
    if @asset.update(asset_params)
      redirect_to @asset
    else
      render 'edit'
    end
  end
  
  def new
    @asset = Resource.new
  end
  
  def destroy
    @asset = Resource.find(params[:id])
    @asset.destroy
      
    redirect_to resources_path
  end
  
  private
    def asset_params
      params.require(:asset).permit(:title, :text)
    end
end
