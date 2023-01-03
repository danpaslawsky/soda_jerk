class CocktailsController < ApplicationController
  
  #to show all cocktails route: '/cocktails' path: cocktails_path
  def index
    if params[:user_id] #index cocktails for a specific user
        @cocktails = Cocktail.user_cocktails_index(current_user)
    elsif params[:query] #index cocktails based on search query
        @cocktails = Cocktail.query_cocktails_index(params[:query]) 
        if !@cocktails
            flash[:alert] = "No cocktails match your search query" 
            @cocktails = Cocktail.all
        else
            flash[:alert].clear unless flash[:alert] == nil
            @cocktails
        end
    else 
        @cocktails = Cocktail.all 
    end 
  end 

  # to render a new form route: /cocktails/new path: new_cocktail_path
  def new
    @cocktail = Cocktail.new
    5.times { @cocktail.cocktail_ingredients.build.build_ingredient}
  end  

  def create
    @cocktail = @user.cocktails.build(cocktail_params)
    if @cocktail.save 
        redirect_to user_cocktail_path(@user, @cocktail)
    else 
        5.times { @cocktail.cocktail_ingredients.build.build_ingredient}
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
