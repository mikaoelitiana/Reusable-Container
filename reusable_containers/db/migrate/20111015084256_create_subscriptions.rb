class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :alias
      t.string :email
      t.string :phone_number
      t.string :website
      t.string :twitter_username
      t.string :other
      t.string :as
      t.text :about
      t.text :expectations

      t.timestamps
    end
  end
end
