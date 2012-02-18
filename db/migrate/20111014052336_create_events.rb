class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :baseline
      t.datetime :scheduled_at
      t.text :description
      t.references :host

      t.timestamps
    end
    add_index :events, :host_id
  end
end
