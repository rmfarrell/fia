class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :oid
      t.string :retrievalURL
      t.date :activeFrom
      t.date :activeTo
      t.string :objectType
      t.string :eventType
      t.string :description
      t.string :lang
      t.string :license
      t.integer :length
      t.string :mimeType

      t.timestamps
    end
  end
end
