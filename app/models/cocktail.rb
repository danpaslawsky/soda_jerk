class Cocktail < ApplicationRecord
    belongs_to :user
    has_many :cocktail_ingredients
    has_many :ingredients, through: :cocktail_ingredients

    
    
    def self.user_cocktails_index(user) #queries all cocktails for a  specific user for index view
        @cocktails = user.cocktails.all
    end 

    


end
