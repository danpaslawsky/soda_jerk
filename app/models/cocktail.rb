class Cocktail < ApplicationRecord
    belongs_to :user
    has_many :cocktail_ingredients
    has_many :ingredients, through: :cocktail_ingredients

    
    # queries all cocktails for a  specific user for index view
    def self.user_cocktails_index(user) 
        @cocktails = user.cocktails.all
    end 

    # queries all cocktails for a user search term for index view
    # Check for valid ingredient -> true -> find_cocktails_by_ingredient
    def self.query_cocktails_index(query) 
        if Ingredient.valid_ingredient(query)
            @cocktails = Cocktail.find_cocktails_by_ingredient(query)
        end 
    end 

    def self.find_cocktails_by_ingredient(query) 
        ingredients = query.scan(/\w+/) #omit spaces special characters, return whole strings only
        cocktail_ids = []
        
        ingredients.each do |i| #Iterate over each search term
            ingredient = Ingredient.find_ingredient(i.downcase)
            ingredient.each do |o| #Iterate over returned valid ingredients to locate associated cocktail_ingredient objects where ingredient id is present. 
                ids = CocktailIngredient.all.where(ingredient_id: o.id)
            
                ids.each do |c| 
                    cocktail_ids << c.cocktail_id #shovel cocktail_id from favorite object into cocktail_ids array
                end 
            end 
        end 

        @cocktails = Cocktail.all.where(id: cocktail_ids) #locate all cocktails where cocktail_id is present, returns array
        
        if !@cocktails.empty?
            @cocktails
        end 
    end 



end
