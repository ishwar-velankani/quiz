class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.string :op1
      t.string :op2
      t.string :op3
      t.string :op4
      t.integer :correct
      t.integer :input_answer

      t.timestamps null: false
    end
  end
end
