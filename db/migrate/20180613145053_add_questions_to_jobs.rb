class AddQuestionsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :questions, :text
  end
end
