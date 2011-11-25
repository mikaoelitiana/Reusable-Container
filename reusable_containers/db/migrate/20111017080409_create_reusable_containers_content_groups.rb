class CreateReusableContainersContentGroups < ActiveRecord::Migration
  def change
    create_table :reusable_containers_content_groups do |t|
      t.string :name
      t.string :title

      t.timestamps
    end
  end
end
