class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question
      t.string :team_stage
      t.integer :appear
      t.integer :frequency
      t.string :question_type
      t.references :role, foreign_key: true
      t.boolean :is_required
      t.string :conditions
      t.references :mapping, foreign_key: true

      t.timestamps
    end
  end
end
