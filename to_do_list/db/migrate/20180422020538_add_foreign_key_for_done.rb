class AddForeignKeyForDone < ActiveRecord::Migration[5.1]
  def change
     add_reference :dones, :to_do, index: true
  end
end
