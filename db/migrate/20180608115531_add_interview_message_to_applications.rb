class AddInterviewMessageToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :interview_message, :text
  end
end
