class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :first_name
      t.string :last_name
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
