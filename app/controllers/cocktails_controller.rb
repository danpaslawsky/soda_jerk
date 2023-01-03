class CocktailsController < ApplicationController
  
  #to show all cocktails route: '/cocktails' path: cocktails_path
  def index
    
  end 

  # to render a new form route: /cocktails/new path: new_cocktail_path
  def new
    @cocktail = Cocktail.new
  end  

  def create
    @cocktail = @user.cocktails.build(cocktail_params)
    if @cocktail.save 
        redirect_to user_cocktail_path(@user, @cocktail)
    else 
        render 'new'
    end 
  end 

  def show
  end

  def edit
  end

  def update

  end

  def destroy
  end

  private

   # Only allow a list of trusted parameters through.
   def cocktail_params
    params.require(:cocktail).permit(:cocktail_name, :instructions, cocktail_ingredients_attributes: [:id, :quantity,
    ingredient_attributes: [:ingredient_name]])
   end


  
end
