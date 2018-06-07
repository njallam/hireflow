class AddOfferToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :offer, :text
  end
end
