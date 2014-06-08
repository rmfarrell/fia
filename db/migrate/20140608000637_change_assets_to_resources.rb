class ChangeAssetsToResources < ActiveRecord::Migration
  def change
    rename_table :assets, :resources
  end
end
