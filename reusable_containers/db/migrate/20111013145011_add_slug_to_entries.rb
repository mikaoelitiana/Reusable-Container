class AddSlugToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :slug, :string
    remove_index :entries, :ancestry_slug
    add_index :entries, [ :slug, :ancestry_slug ], :unique => true
  end
end
