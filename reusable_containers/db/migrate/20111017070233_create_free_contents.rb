class CreateFreeContents < ActiveRecord::Migration
  def change
    create_table :free_contents do |t|
      t.string :name
      t.string :title
      t.string :css_classes
      t.string :css_id
      t.text :content
      t.string :content_type

      t.timestamps
    end
  end
end
