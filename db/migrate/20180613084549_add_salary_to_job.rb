class AddSalaryToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :salary, :integer, :default => 0
  end
end
