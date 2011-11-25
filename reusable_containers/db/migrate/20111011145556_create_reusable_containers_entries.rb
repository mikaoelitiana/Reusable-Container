class CreateReusableContainersEntries < ActiveRecord::Migration
  def change
    create_table :reusable_containers_entries do |t|
      t.string :name
      t.string :title
      t.string :text
      t.string :keywords
      t.string :description
      t.references :container

      t.timestamps
    end
    add_index :reusable_containers_entries, :container_id
  end
end
