class AddRejectedToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :rejected, :boolean
  end
end
