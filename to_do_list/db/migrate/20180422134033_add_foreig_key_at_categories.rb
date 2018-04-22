class AddForeigKeyAtCategories < ActiveRecord::Migration[5.1]
  def change
         add_reference :categories, :to_do, index: true
  end
end
