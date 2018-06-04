class AddUniversityToApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :applicants, :university, :string
  end
end
