class AddStatusToReusableContainersEntries < ActiveRecord::Migration
  def change
    add_column :reusable_containers_entries, :published, :boolean, :default => false
  end
end
