class AddColumnsToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :category_id, :integer
    add_column :lists, :due_date, :date
  end
end
