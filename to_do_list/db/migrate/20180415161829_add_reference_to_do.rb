class AddReferenceToDo < ActiveRecord::Migration[5.1]
  def change
    add_reference :activities, :to_do, index: true
  end
end
