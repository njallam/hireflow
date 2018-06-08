class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :title
      t.string :result
      t.references :education, foreign_key: true

      t.timestamps
    end
  end
end
