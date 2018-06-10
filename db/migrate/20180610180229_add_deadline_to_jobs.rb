class AddDeadlineToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :deadline, :datetime
    remove_column :jobs, :closed, :boolean
  end
end
