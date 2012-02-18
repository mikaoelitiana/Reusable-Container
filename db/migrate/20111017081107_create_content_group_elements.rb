class CreateContentGroupElements < ActiveRecord::Migration
  def change
    create_table :content_group_elements do |t|
      t.references :content_group
      t.references :element, :polymorphic => true
      t.integer :position, :default => 0
      t.string :layout, :default => 'default'

      t.timestamps
    end
    add_index :content_group_elements, :content_group_id
    add_index :content_group_elements, [ :element_id, :element_type ], :name => 'index_content_group_elements_on_element'
  end
end
