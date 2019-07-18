class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe_types = RecipeType.all
  end

  def create
    @recipe_types = RecipeType.all
    @recipe = Recipe.new(recipe_params)
    
    if @recipe.save!
      redirect_to @recipe
    else
      flash[:alert] = "Você deve informar todos os dados da receita"
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash[:alert] = "Você deve informar todos os dados da receita"
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :cuisine, :difficulty, :cook_time, 
      :ingredients, :cook_method, :recipe_type)
  end
end
