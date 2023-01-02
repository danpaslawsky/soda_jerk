class CocktailsController < ApplicationController
  
  def index
    @cocktails = Cocktail.all
  end

  def new
    @coctail = Cocktail.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy
  end


  
end
