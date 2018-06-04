class AddCoverLetterToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :cover_letter, :text
  end
end
