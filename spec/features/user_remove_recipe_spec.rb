require 'rails_helper'

feature 'User remove recipe' do
  scenario 'successfully' do
    #arrange
    recipe_type = RecipeType.create(name: 'Sobremesa')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: 'Brasileira', difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    #act
    visit root_path
    click_on 'Bolo de cenoura'
    #click_on recipe.title
    click_on 'Remover'

    #assert
    expect(current_path).to eq root_path
    expect(page).not_to have_content('Bolo de cenoura')
  end

  scenario 'Remove a recipe and keep all others' do
    #arrange
    recipe_type = RecipeType.create(name: 'Sobremesa')
    removed_recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                            cuisine: 'Brasileira', difficulty: 'Médio',
                            cook_time: 60,
                            ingredients: 'Farinha, açucar, cenoura',
                            cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
    recipe = Recipe.create(title: 'Mousse de maracuja', recipe_type: recipe_type,
                            cuisine: 'Brasileira', difficulty: 'Médio',
                            cook_time: 60,
                            ingredients: 'Gelatina, açucar, maracuja',
                            cook_method: 'Cozinhe a gelatina, bata a massa, misture com o restante dos ingredientes')

    #act
    visit root_path
    click_on 'Bolo de cenoura'
    #click_on recipe.title
    click_on 'Remover'

    #assert
    expect(current_path).to eq root_path
    expect(page).not_to have_content(removed_recipe.title)
    expect(page).to have_content(recipe.title)
  end
end
