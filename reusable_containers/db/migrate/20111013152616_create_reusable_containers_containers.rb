class CreateReusableContainersContainers < ActiveRecord::Migration
  def change
    create_table :reusable_containers_containers do |t|
      t.string :name
      t.string :layout, :default => "default"

      t.timestamps
    end
  end
end
