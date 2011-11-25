class AddDestinationToReusableContainersEntries < ActiveRecord::Migration
  def change
    add_column :reusable_containers_entries, :destination_string, :string
    change_table :reusable_containers_entries do |t|
      t.references :destination_object, :polymorphic => true
    end
    add_index :reusable_containers_entries, [ :destination_object_type, :destination_object_id ], :name => "index_entries_on_destination_object"
  end
end
