class CreateCocktailIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktail_ingredients do |t|
      t.string :quantity
      t.integer :cocktail_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
