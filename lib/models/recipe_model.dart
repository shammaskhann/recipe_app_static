class Recipe {
  String? recipeName;
  int? calories;
  int? totalServing;
  String? recipeDescription;
  String? imageUrl;
  String? makingTime;
  double? rating;
  String? category;
  String? tags;

  Recipe(
      {this.recipeName,
      this.calories,
      this.totalServing,
      this.recipeDescription,
      this.imageUrl,
      this.makingTime,
      this.rating,
      this.category,
      this.tags});

  Recipe.fromJson(Map<String, dynamic> json) {
    recipeName = json['RecipeName'];
    calories = json['Calories'];
    totalServing = json['TotalServing'];
    recipeDescription = json['RecipeDescription'];
    imageUrl = json['ImageUrl'];
    makingTime = json['MakingTime'];
    rating = json['Rating'];
    category = json['Category'];
    tags = json['Tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RecipeName'] = recipeName;
    data['Calories'] = calories;
    data['TotalServing'] = totalServing;
    data['RecipeDescription'] = recipeDescription;
    data['ImageUrl'] = imageUrl;
    data['MakingTime'] = makingTime;
    data['Rating'] = rating;
    data['Category'] = category;
    data['Tags'] = tags;
    return data;
  }
}
