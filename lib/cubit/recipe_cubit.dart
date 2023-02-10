import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recipe_book/cubit/recipe_repository_impl.dart';
import 'package:recipe_book/model/recipe.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final RecipeRepository _recipeRepository;

  RecipeCubit(this._recipeRepository) : super(const RecipeState());

  Future<void> updateData() async {
    emit(const RecipeState(status: RecipeStatus.update));
    await getData();
  }

  Future<void> getData() async {
    try {
      List<Recipe> recipeData = await _recipeRepository.fetchData();
      emit(RecipeState(status: RecipeStatus.loaded, recipes: recipeData));
    } on Exception catch (exception) {
      emit(RecipeState(status: RecipeStatus.error, exception: exception));
    }
  }

  Future<void> createRecipe(Recipe recipe) async {
    try {
      await _recipeRepository.createData(recipe);
      await updateData();
    } on Exception catch (exception) {
      emit(RecipeState(status: RecipeStatus.error, exception: exception));
    }
  }

  Future<void> deleteRecipe(int id) async {
    try {
      await _recipeRepository.deleteData(id);
      await updateData();
    } on Exception catch (exception) {
      emit(RecipeState(status: RecipeStatus.error, exception: exception));
    }
  }


}
