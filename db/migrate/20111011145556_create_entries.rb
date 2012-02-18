class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.string :title
      t.string :text
      t.string :keywords
      t.string :description
      t.references :container

      t.timestamps
    end
    add_index :entries, :container_id
  end
end
