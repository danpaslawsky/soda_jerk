class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :cocktail_name
      t.string :instructions
      t.integer :user_id

      t.timestamps
    end
  end
end
