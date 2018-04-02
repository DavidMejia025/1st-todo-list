class CreateToDo < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :name 
      t.belongs_to :category, foreing_key: true
      t.belongs_to :calendar, foreing_key: true
      t.timestamps null: false
    end
  end
end
