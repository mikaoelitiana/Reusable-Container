class CreateContentGroups < ActiveRecord::Migration
  def change
    create_table :content_groups do |t|
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
