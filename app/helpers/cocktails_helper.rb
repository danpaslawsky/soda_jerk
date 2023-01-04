module CocktailsHelper
    
    def current_cocktail
        #find current cocktail
        @cocktail = Cocktail.find_by(id: params[:id])
    end
end
