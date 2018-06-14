class AddFieldToEducations < ActiveRecord::Migration[5.2]
  def change
    add_column :educations, :field, :string
  end
end
