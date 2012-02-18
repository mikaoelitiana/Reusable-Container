class AddDestinationToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :destination_string, :string
    change_table :entries do |t|
      t.references :destination_object, :polymorphic => true
    end
    add_index :entries, [ :destination_object_type, :destination_object_id ], :name => "index_entries_on_destination_object"
  end
end
