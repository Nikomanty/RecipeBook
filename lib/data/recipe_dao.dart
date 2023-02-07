import 'package:floor/floor.dart';
import 'package:recipe_book/model/recipe.dart';

@dao
abstract class RecipeDao{
  @Query('SELECT * FROM Recipe')
  Future<List<Recipe>> getAllRecipes();

  @Query('SELECT * FROM Recipe WHERE id = :id')
  Future<Recipe?> getRecipeById(int id);

  @insert
  Future<void> insertRecipe(Recipe recipe);

  @Query('DELETE FROM Recipe WHERE id = :id')
  Future<void> deleteRecipe(int id);
}