import 'package:flutter/cupertino.dart';
import 'package:focofit/models/k_models/recipe_data.dart';
import 'package:focofit/utils/app_strings.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  ///text fields controllers
  final TextEditingController searchController = TextEditingController();
  final TextEditingController recipeNameC = TextEditingController();
  final TextEditingController recipeIngredientC = TextEditingController();
  final TextEditingController recipeIngredientQuantityC = TextEditingController();
  final TextEditingController recipeDescriptionC = TextEditingController();



  ///list wheel scroll controllers
  final FixedExtentScrollController quantityController = FixedExtentScrollController();

  ///Custom Lists
  final RxList<String> quantityTypeList= [AppStrings.dessertSpoon,AppStrings.teaSpoon,AppStrings.tableSpoon,'ml',AppStrings.grams,AppStrings.cupOfTea,AppStrings.cupOfCoffee].obs;
  RxList<RecipeDetails> ingredients = [
    RecipeDetails(AppStrings.tomato, AppStrings.pcs2, [
      PreparationDetails(AppStrings.chopTomatoes),
    ]),
    RecipeDetails(AppStrings.onion, AppStrings.pcs2, [
      PreparationDetails(AppStrings.addTomatoes),
    ]),
  ].obs;


  ///Variables
  final RxString selectedQuantityType = ''.obs;
  RxBool focused = false.obs;
  RxBool searching = false.obs;
  RxDouble currentCalories = 0.0.obs;
  RxDouble currentTime = 0.0.obs;
  var selectedSnacks = <int>[].obs;
  var selectedDiets = <int>[].obs;
  var selectedDifficulty = <int>[].obs;

}


