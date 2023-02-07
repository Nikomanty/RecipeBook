import 'package:flutter/material.dart';
import 'package:recipe_book/cubit/recipe_cubit.dart';
import 'package:recipe_book/cubit/recipe_repository_impl.dart';
import 'package:recipe_book/data/recipe_database.dart';
import 'package:recipe_book/recipe_book_bloc_observer.dart';
import 'package:recipe_book/res/recipe_book_strings.dart';
import 'package:recipe_book/view/recipe_book.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RecipeDatabase database =
      await $FloorRecipeDatabase.databaseBuilder('recipe_database.db').build();
  Bloc.observer = RecipeBookBlocObserver();
  runApp(BlocProvider(
    create: (context) => RecipeCubit(RecipeRepositoryImpl(database))..getData(),
    child: const MaterialApp(
      title: RecipeBookStrings.appTitle,
      home: RecipeBook(),
    ),
  ));
}
