class CreateTodo < ActiveRecord::Migration[5.1]
  def change
    create_table :to_dos do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end