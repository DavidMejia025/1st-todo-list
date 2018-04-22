class AddColumnActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :count, :integer
  end
end
