class Resource < ActiveRecord::Base
  
  scope :oid, -> (oid) { where oid: (oid) }
  
  # scope :status, -> (status) { where status: status }
  #   scope :location, -> (location_id) { where location_id: location_id }
  #   scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
  
  def self.findbyoid(params)
    Resource.find_by(oid: params)
  end
  
  # def self.search(params)
  #   # Resource.where(oid: params[:oid]) if params.has_key?(:oid)
  #   # Resource.where(objecttype: params[:objecttype]) if params.has_key?(:objecttype)
  #   # 
  #   # Resource.order(:oid)
  #   
  #   scope :status
  # end
end