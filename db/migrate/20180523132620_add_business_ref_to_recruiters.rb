class AddBusinessRefToRecruiters < ActiveRecord::Migration[5.2]
  def change
    add_reference :recruiters, :business, foreign_key: true
  end
end
