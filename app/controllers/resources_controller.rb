class ResourcesController < ApplicationController
  respond_to :xml,:json
  #before_action :set_asset, only: [:show, :edit, :update, :destroy]
  
  def index
    @assets = Resource.where(nil)
    @assets = @assets.oidTest(params[:oid]) if params[:oid].present?
    @assets = @assets.urlTest(params[:retrievalurl]) if params[:retrievalurl].present?
    @assets = @assets.objectTypeTest(params[:objecttype]) if params[:objecttype].present?
    @assets = @assets.eventTypeTest(params[:eventtype]) if params[:eventtype].present?
    @assets = @assets.langTypeTest(params[:lang]) if params[:lang].present?
    @assets = @assets.searchDescription(params[:contains]) if params[:contains].present?
    @assets = @assets.isActive() unless params[:showinactive] == 'true'
    
    respond_to do |format|
      format.html { render :xml => @assets }# index.html.erb
      format.xml { render :xml => @assets }# index.xml.builder
      format.json { render :json => @assets }# index.xml.builder
    end
  end
  
  def findbyoid
    @asset = Resource.findbyoid(params[:oid])
    
    respond_to do |format|
      format.html { render :xml => @asset }# index.html.erb
      format.xml { render :xml => @asset }# index.xml.builder
      format.json { render :json => @asset }# index.xml.builder
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
  
  def display
    conditions = []
    conditions << [ "in_production = ?", params[:in_production] ] if params[:in_production].present?
    conditions << [ "year = ?", params[:year] ] if params[:year].present?
    conditions << [ "make = ?", params[:make] ] if params[:make].present?
    @cars = Car.all(:conditions => conditions )
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
  
    def conditions

      c = Array.new
      c << [ "oid = ?", params[:oid] ] if params[:oid].present?
      c << [ "year = ?", params[:year] ] if params[:year].present?
      c << [ "make = ?", params[:make] ] if params[:make].present?
      
      return c
    end
    
    #NOPE WRONG-O
    # def conditions2 
    #       
    #       allowedKeys = [
    #         "oid",
    #         "objecttype"
    #       ]
    #       
    #       conditions = ['']
    #     
    #       #conditionalKeys = ""
    #       
    #       conditionalValues = []
    #       
    #       customParams = params.clone
    #       
    #       customParams.delete("controller")
    #       
    #       customParams.delete("action")
    #       
    #       downCounter = customParams.length
    #       
    #       upCounter = 0
    #       
    #       params.each do |key,value|
    #         
    #         if allowedKeys.include? key
    #           
    #           #Put the 
    #           downCounter -= 1
    #           conditions[0] << key + "=? "
    #           conditions[0] << "AND " if downCounter > 0
    #           
    #           #Populate 
    #           upCounter + -1
    #           conditions << value
    #         end
    #       end
    #       
    #       return conditions
    #       
    #       return ["oid=? AND objecttype=?", "45", "warningText"]
    #     end
    
    def resource_params
      params.require(:resource).permit(:oid, :retrievalURL, :activeFrom, :activeTo, :objectType, :eventType, :description, :lang, :license, :length, :mimeType)
    end
end
