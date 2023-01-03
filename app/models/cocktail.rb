class Cocktail < ApplicationRecord
    belongs_to :user
    has_many :cocktail_ingredients
    has_many :ingredients, through: :cocktail_ingredients

    validates :cocktail_name, presence: true
    validates :instructions, presence: true 
    validates :cocktail_ingredients, presence: true

    validates_associated :cocktail_ingredients

    accepts_nested_attributes_for :cocktail_ingredients
    



end
