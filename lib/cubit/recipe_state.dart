part of 'recipe_cubit.dart';

enum RecipeStatus { initial, update, loaded, error }

@immutable
class RecipeState extends Equatable {
  final RecipeStatus status;
  final List<Recipe>? recipes;
  final Exception? exception;

  const RecipeState({
    this.status = RecipeStatus.initial,
    this.recipes,
    this.exception,
  });

  RecipeState copyWith(
    RecipeStatus? status,
    List<Recipe>? recipes,
    Exception? exception,
  ) {
    return RecipeState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [status, recipes];
}
