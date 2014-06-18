class Resource < ActiveRecord::Base
  
  scope :oidTest, -> (oid) { where oid: oid }
  scope :urlTest, -> (retrievalurl) { where retrievalURL: retrievalurl }
  scope :objectTypeTest, -> (objecttype) { where objectType: objecttype}
  scope :langTypeTest, -> (language) { where lang: language}
  #scope :search, -> (search) {where description: search}
  scope :searchDescription, -> (search) { where("description like ?", "%#{search}%")}
  scope :eventTypeTest, -> (eventtype) {where('eventType=? OR eventType=?', eventtype, 'any')}
  scope :isActive, -> () { where activeTo: '9999-12-31'}
  
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