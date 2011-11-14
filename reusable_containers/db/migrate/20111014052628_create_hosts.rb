class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :short_description
      t.text :description
      t.string :gmap

      t.timestamps
    end
  end
end
