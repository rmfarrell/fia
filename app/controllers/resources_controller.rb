class ResourcesController < ApplicationController
  respond_to :xml,:json
  #before_action :set_asset, only: [:show, :edit, :update, :destroy]

  # GET /assets
  # GET /assets.json
  def index
    @assets = Resource.all
    
    respond_to do |format|
      format.html { render :xml => @assets }# index.html.erb
      format.xml { render :xml => @assets }# index.xml.builder
      format.json { render :json => @assets }# index.xml.builder
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @asset = Resource.find(params[:id])
    
    respond_to do |format|
      format.html { render :xml => @asset }# index.html.erb
      format.xml { render :xml => @asset }# index.xml.builder
      format.json { render :json => @asset }# index.xml.builder
    end
  end

  # GET /assets/new
  # def new
  #   #@asset = Asset.new
  # end

  # GET /assets/1/edit
  def edit
    redirect_to "/"
  end

  # POST /assets
  # POST /assets.json
  def create
    @asset = Resource.new(resource_params)
    
    if @asset.save
      redirect_to admin_resource_path(@asset), notice: 'Resource was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    @asset = Resource.find(params[:id])
    if @asset.update(resource_params)
      redirect_to admin_resource_path(@asset), notice: 'Resource was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset = Resource.find(params[:id])
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to admin_resources_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_asset
    #       @asset = Asset.find(params[:id])
    #     end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:oid, :retrievalURL, :activeFrom, :activeTo, :objectType, :eventType, :description, :lang, :license, :length, :mimeType)
    end
end
