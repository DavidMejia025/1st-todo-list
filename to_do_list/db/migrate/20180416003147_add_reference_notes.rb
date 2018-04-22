class AddReferenceNotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :dones, :activity, index: true
  end
end
