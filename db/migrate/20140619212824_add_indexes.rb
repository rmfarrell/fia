class AddIndexes < ActiveRecord::Migration
  def change
    add_index(:resources, :objectType)
    add_index(:resources, :eventType)
    add_index(:resources, :lang)
    add_index(:resources, :activeTo)
  end
end
