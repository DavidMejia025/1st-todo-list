class CreateDone < ActiveRecord::Migration[5.1]
  def change
    create_table :dones do |t|
      t.timestamps null: false
    end
  end
end
