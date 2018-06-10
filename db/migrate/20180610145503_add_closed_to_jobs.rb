class AddClosedToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :closed, :boolean, null: false, default: false
    change_column_null :applications, :rejected, false, false
    change_column_default :applications, :rejected, false
  end
end
