class CocktailsController < ApplicationController
  before_action :current_user
  before_action :require_login
  #before_action :set_cocktail
  
  #to show all cocktails route: '/cocktails' path: cocktails_path
  def index
    binding.pry
    @cocktail = User.all
    
  end

  # to render a new form route: /cocktails/new path: new_cocktail_path
  def new
    @cocktail = Cocktail.new
    #3.times { @cocktail.cocktail_ingredients.build.build_ingredient}
  end  

  # process submitted new form route: '/cocktails' path: coctails_path (only used on servers side)
  def create
    #byebug
    @cocktail = current_user.cocktails.build(cocktail_params)
    if @cocktail.save 
        redirect_to cocktail_path(@cocktail)
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

  def set_cocktail
    @cocktail = Cocktail.find_by(params[:id])
  end

   # Only allow a list of trusted parameters through.
   def cocktail_params
      params.require(:cocktail).permit(:cocktail_name, :instructions, cocktail_ingredients_attributes: [:quantity, ingredients_attributes: [:ingredient_name]])
   end


  
end
