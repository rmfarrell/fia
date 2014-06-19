class Resource < ActiveRecord::Base
  
  scope :oidTest, -> (oid) { where oid: oid }
  scope :urlTest, -> (retrievalurl) { where retrievalURL: retrievalurl }
  scope :objectTypeTest, -> (objecttype) {where('objectType=? OR objectType=?', objecttype, 'any')}
  scope :langTypeTest, -> (lang) { where('lang=? OR lang=?', 'any', lang) }
  #scope :search, -> (search) {where description: search}
  scope :searchDescription, -> (search) { where("description LIKE ?", "%#{search}%".downcase)}
  scope :eventTypeTest, -> (eventtype) {where('eventType=? OR eventType=?', eventtype, 'any')}
  scope :isActive, -> () { where activeTo: '9999-12-31'}
  
  # scope :status, -> (status) { where status: status }
  #   scope :location, -> (location_id) { where location_id: location_id }
  #   scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
  
  def self.findbyoid(params)
    Resource.find_by(oid: params)
  end
  
  def self.find_all_by_name(name)
    find(:all, :conditions => ["LOWER(name) = ?", name.downcase])
  end
  
  private
  
  # def self.search(params)
  #   # Resource.where(oid: params[:oid]) if params.has_key?(:oid)
  #   # Resource.where(objecttype: params[:objecttype]) if params.has_key?(:objecttype)
  #   # 
  #   # Resource.order(:oid)
  #   
  #   scope :status
  # end
end