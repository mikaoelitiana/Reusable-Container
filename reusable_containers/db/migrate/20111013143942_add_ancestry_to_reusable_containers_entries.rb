class AddAncestryToReusableContainersEntries < ActiveRecord::Migration
  def change
    add_column :reusable_containers_entries, :ancestry, :string
    add_column :reusable_containers_entries, :ancestry_depth, :integer, :default => 0
    add_column :reusable_containers_entries, :ancestry_slug, :string

    add_index :reusable_containers_entries, :ancestry
    add_index :reusable_containers_entries, :ancestry_slug
  end
end
