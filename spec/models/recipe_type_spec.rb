require 'rails_helper'

RSpec.describe RecipeType, type: :model do
  
  it 'should not be valid' do
    recipe_type = RecipeType.new(name: '')

    expect(recipe_type.valid?).to eq false
  end

  it 'should be valid' do
    recipe_type = RecipeType.new(name: 'Sobremesa')

    expect(recipe_type.valid?).to eq true
  end

  it 'Recipe type name should be unique' do
    recipe_type = RecipeType.new(name: 'Entrada')
    duplicated_recipe_type = RecipeType.new(name: 'Entrada')

    expetc(duplicated_recipe_type)
  end
end
