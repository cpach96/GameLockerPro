class AddCategoryIdToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :category_id, :string
  end
end
