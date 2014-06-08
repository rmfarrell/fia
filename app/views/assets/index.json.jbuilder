json.array!(@assets) do |asset|
  json.extract! asset, :id, :oid, :retrievalURL, :activeFrom, :activeTo, :objectType, :eventType, :description, :lang, :license, :length, :mimeType
  json.url asset_url(asset, format: :json)
end
