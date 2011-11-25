class AddSlugToReusableContainersEntries < ActiveRecord::Migration
  def change
    add_column :reusable_containers_entries, :slug, :string
    remove_index :reusable_containers_entries, :ancestry_slug
    add_index :reusable_containers_entries, [ :slug, :ancestry_slug ], :unique => true
  end
end
