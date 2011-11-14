class AddOrganisationToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :organisation, :string
  end
end
