class NewMetaFields < ActiveRecord::Migration
  def change
    add_column :resources, :contributorName, :string
    add_column :resources, :contributorEmail, :string
    add_column :resources, :useConstraints, :string
  end
end
