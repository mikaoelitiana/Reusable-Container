class AddStatusToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :published, :boolean, :default => false
  end
end
