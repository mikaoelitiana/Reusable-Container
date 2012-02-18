class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :name
      t.string :layout, :default => "default"

      t.timestamps
    end
  end
end
