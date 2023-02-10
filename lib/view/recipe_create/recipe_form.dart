import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_book/constants/recipe_book_strings.dart';
import 'package:recipe_book/cubit/recipe_cubit.dart';
import 'package:recipe_book/model/recipe.dart';
import 'package:recipe_book/view/recipe_create/components/ingredients_input_field.dart';
import 'package:recipe_book/view/recipe_create/components/introduction_input_field.dart';
import 'package:recipe_book/widgets/containers/labeled_outline_box.dart';
import 'package:recipe_book/widgets/images/rounded_image.dart';

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key});

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final _formKey = GlobalKey<FormState>();
  late String _imagePath = "";
  late String _recipeName = "";
  late int _duration = 0;
  final List<Ingredient> _ingredients = [];
  final List<String> _introductions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: getNewRecipeForm(),
      ),
    );
  }

  ListView getNewRecipeForm() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        LabeledOutlineBox(
          label: RecipeBookStrings.recipeImageString,
          child: InkWell(
            child: _recipePicker(),
            onTap: () {
              _pickImage(ImageSource.gallery);
            },
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        TextFormField(
          validator: (value) {
            debugPrint(value);
            if (value != null && value.isEmpty) {
              return RecipeBookStrings.mustAddRecipeName;
            }
            return null;
          },
          onChanged: (value) {
            _recipeName = value.trim();
          },
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
              hintText: RecipeBookStrings.addRecipeNameHint),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        TextFormField(
          onChanged: (value) {
            _duration = int.parse(value);
          },
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: RecipeBookStrings.durationSelectorHint),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        IngredientInputField(
          contentToUpdate: _ingredients,
          valueKey: "ingredients",
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        IntroductionInputField(
          contentToUpdate: _introductions,
          valueKey: "introductions",
        ),
        _createCreateRecipeButton(context),
      ],
    );
  }

  Widget _recipePicker() {
    if (_imagePath.isNotEmpty) {
      return RoundedImage(
        imagePath: _imagePath,
        height: 300,
        aspectRatio: 4 / 3,
      );
    } else {
      return const SizedBox(
        height: 300,
        child: Center(
            child: Text(
          RecipeBookStrings.clickToAddImage,
          textAlign: TextAlign.center,
        )),
      );
    }
  }

  Widget _createCreateRecipeButton(BuildContext context) {
    return TextButton(
      child: const Text(
        RecipeBookStrings.createRecipe,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      onPressed: () {
        _trySubmit();
      },
    );
  }

  Future _pickImage(ImageSource source) async {
    try {
      final PickedFile? image = await ImagePicker().getImage(source: source);
      if (image != null) {
        setState(() {
          _imagePath = image.path;
        });
      }
    } on PlatformException catch (error) {
      throw Exception(error);
    }
  }

  void _trySubmit() {
    debugPrint(_recipeName);
    debugPrint(_duration.toString());
    final isValid = _formKey.currentState?.validate();
    if (isValid! && isValid) {
      _formKey.currentState?.save();
      _submitRecipeForm(
        _recipeName,
        _duration,
        _ingredients,
        _introductions,
      );
    }
  }

  void _submitRecipeForm(String recipeName, int duration,
      List<Ingredient> ingredients, List<String> introductions) {
    context.read<RecipeCubit>().createRecipe(Recipe(
          recipeName: _recipeName,
          duration: _duration,
          ingredients: _ingredients,
          introductions: _introductions,
          image: _imagePath,
        ));
    Navigator.pop(context);
  }
}
