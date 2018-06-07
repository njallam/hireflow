class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :place
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :applicant, foreign_key: true

      t.timestamps
    end
  end
end
