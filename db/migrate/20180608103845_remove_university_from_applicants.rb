class RemoveUniversityFromApplicants < ActiveRecord::Migration[5.2]
  def change
    remove_column :applicants, :university, :string
  end
end
