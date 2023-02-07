import 'package:recipe_book/data/recipe_database.dart';
import 'package:recipe_book/model/recipe.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  late RecipeDatabase _database;

  RecipeRepositoryImpl(RecipeDatabase database) : super(database) {
    _database = database;
  }

  @override
  Future<List<Recipe>> fetchData() {
    return _database.recipeDao.getAllRecipes();
  }

  @override
  Future<void> createData(Recipe recipe) {
    return _database.recipeDao.insertRecipe(recipe);
  }

  @override
  Future<void> deleteData(int id) {
    return _database.recipeDao.deleteRecipe(id);
  }

}

abstract class RecipeRepository {
  RecipeRepository(RecipeDatabase database);
  Future<List<Recipe>> fetchData();
  Future<void> createData(Recipe recipe);
  Future<void> deleteData(int id);
}