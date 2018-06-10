class AddSizeToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :size, :integer
  end
end
