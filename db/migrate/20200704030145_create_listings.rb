class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :genre
      t.integer :price
      t.string :platform
      t.string :publisher

      t.timestamps
    end
  end
end
