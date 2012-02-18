class AddAncestryToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :ancestry, :string
    add_column :entries, :ancestry_depth, :integer, :default => 0
    add_column :entries, :ancestry_slug, :string

    add_index :entries, :ancestry
    add_index :entries, :ancestry_slug
  end
end
