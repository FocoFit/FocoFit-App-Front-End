class RecipeDetails {
  final String name;
  final String quantity;
  final List<PreparationDetails>? preparationList;

  RecipeDetails(this.name, this.quantity, this.preparationList);
}

class PreparationDetails {
  final String preparationDetails;

  PreparationDetails(this.preparationDetails);
}
class ActivityLevelList{
  String? title;
  String? subTitle;
  ActivityLevelList({this.title,this.subTitle});
}