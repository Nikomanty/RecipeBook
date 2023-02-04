class Recipe {
  final String recipeName;
  final int duration;
  final List<String> ingredients;
  final List<String> introductions;
  final String image;

  Recipe({
    required this.recipeName,
    required this.duration,
    required this.ingredients,
    required this.introductions,
    required this.image,
  });
}
