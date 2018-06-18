class AddTestToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :test, :string
  end
end
