import 'dart:convert';

class RecipeResponse {
  bool? ok;
  String? message;
  Data? data;

  RecipeResponse({
    this.ok,
    this.message,
    this.data,
  });

  factory RecipeResponse.fromRawJson(String str) => RecipeResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecipeResponse.fromJson(Map<String, dynamic> json) => RecipeResponse(
    ok: json["ok"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<RecipeModel>? recipes;
  Pagination? pagination;

  Data({
    this.recipes,
    this.pagination,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    recipes: json["recipes"] == null ? [] : List<RecipeModel>.from(json["recipes"]!.map((x) => RecipeModel.fromJson(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "recipes": recipes == null ? [] : List<dynamic>.from(recipes!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Pagination {
  int? totalCount;
  int? totalPages;
  int? currentPage;
  int? pageSize;

  Pagination({
    this.totalCount,
    this.totalPages,
    this.currentPage,
    this.pageSize,
  });

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    totalCount: json["total_count"],
    totalPages: json["total_pages"],
    currentPage: json["current_page"],
    pageSize: json["page_size"],
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "total_pages": totalPages,
    "current_page": currentPage,
    "page_size": pageSize,
  };
}

class RecipeModel {
  String id;
  String image;
  String name;
  String category;
  int calification;
  int timeCreate;
  String difficulty;
  String description;
  bool   active;
  List<Ingredient>? ingredients;
  NutricionalTable? nutricionalTable;
  List<Utensil>? utensils;
  List<StepCooking>? steps;
  DateTime? createdAt;
  DateTime? updatedAt;
 

  RecipeModel({
    required this.id,
    required this.image,
    required this.name,
    required this.category,
    required this.calification,
    required this.timeCreate,
    required this.difficulty,
    required this.description,
    required this.active,
    this.ingredients,
    this.nutricionalTable,
    this.utensils,
    this.steps,
    this.createdAt,
    this.updatedAt,
  });

  factory RecipeModel.fromRawJson(String str) => RecipeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
    id              : json["id"],
    image           : json["image"],
    name            : json["name"],
    category        : json["category"],
    calification    : json["calification"],
    timeCreate      : json["time_create"],
    difficulty      : json["difficulty"],
    description     : json["description"],
    active          : json["active"],
    ingredients     : json["ingredients"] == null ? [] : List<Ingredient>.from(json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
    nutricionalTable: NutricionalTable.fromJson(json["nutricional_table"]),
    utensils        : json["utensils"] == null ? [] : List<Utensil>.from(json["utensils"]!.map((x) => Utensil.fromJson(x))),
    steps           : json["steps"] == null ? [] : List<StepCooking>.from(json["steps"]!.map((x) => StepCooking.fromJson(x))),
    createdAt       : json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
    updatedAt       : json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id"                : id,
    "image"             : image,
    "name"              : name,
    "category"          : category,
    "calification"      : calification,
    "time_create"       : timeCreate,
    "difficulty"        : difficulty,
    "description"       : description,
    "active"            : active,
    "ingredients"       : ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x.toJson())),
    "nutricional_table" : nutricionalTable?.toJson(),
    "utensils"          : utensils == null ? [] : List<dynamic>.from(utensils!.map((x) => x.toJson())),
    "steps"             : steps == null ? [] : List<dynamic>.from(steps!.map((x) => x.toJson())),
    "CreatedAt"         : createdAt?.toIso8601String(),
    "UpdatedAt"         : updatedAt?.toIso8601String(),
  };
}

class Ingredient {
  String? image;
  String name;
  double units;

  Ingredient({
    this.image,
    required this.name,
    required this.units,
  });

  factory Ingredient.fromRawJson(String str) => Ingredient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    image: json["image"],
    name: json["name"],
    units: json["units"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
    "units": units,
  };
}

class NutricionalTable {
  NutritionalTableElement? calories;
  NutritionalTableElement? fat;
  NutritionalTableElement? saturedFat;
  NutritionalTableElement? carbohidrate;
  NutritionalTableElement? sugar;
  NutritionalTableElement? dietaryFiber;
  NutritionalTableElement? protein;
  NutritionalTableElement? cholesterol;
  NutritionalTableElement? sodium;

  NutricionalTable({
    this.calories,
    this.fat,
    this.saturedFat,
    this.carbohidrate,
    this.sugar,
    this.dietaryFiber,
    this.protein,
    this.cholesterol,
    this.sodium,
  });

  factory NutricionalTable.fromRawJson(String str) => NutricionalTable.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NutricionalTable.fromJson(Map<String, dynamic> json) => NutricionalTable(
    calories: json["calories"] == null ? null : NutritionalTableElement.fromJson(json["calories"]),
    fat: json["fat"] == null ? null : NutritionalTableElement.fromJson(json["fat"]),
    saturedFat: json["satured_fat"] == null ? null : NutritionalTableElement.fromJson(json["satured_fat"]),
    carbohidrate: json["carbohidrate"] == null ? null : NutritionalTableElement.fromJson(json["carbohidrate"]),
    sugar: json["sugar"] == null ? null : NutritionalTableElement.fromJson(json["sugar"]),
    dietaryFiber: json["dietary_fiber"] == null ? null : NutritionalTableElement.fromJson(json["dietary_fiber"]),
    protein: json["protein"] == null ? null : NutritionalTableElement.fromJson(json["protein"]),
    cholesterol: json["cholesterol"] == null ? null : NutritionalTableElement.fromJson(json["cholesterol"]),
    sodium: json["sodium"] == null ? null : NutritionalTableElement.fromJson(json["sodium"]),
  );

  Map<String, dynamic> toJson() => {
    "calories": calories?.toJson(),
    "fat": fat?.toJson(),
    "satured_fat": saturedFat?.toJson(),
    "carbohidrate": carbohidrate?.toJson(),
    "sugar": sugar?.toJson(),
    "dietary_fiber": dietaryFiber?.toJson(),
    "protein": protein?.toJson(),
    "cholesterol": cholesterol?.toJson(),
    "sodium": sodium?.toJson(),
  };
}

class NutritionalTableElement {
  String? name;
  int amount;

  NutritionalTableElement({
    this.name,
    required this.amount,
  });

  factory NutritionalTableElement.fromRawJson(String str) => NutritionalTableElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NutritionalTableElement.fromJson(Map<String, dynamic> json) => NutritionalTableElement(
    name: json["name"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount,
  };
}

class StepCooking {
  String image;
  String description;
  List<Utensil>? utensiliosSteps;
  List<Ingredient>? ingredientsSteps;

  StepCooking({
    required this.image,
    required this.description,
    this.utensiliosSteps,
    this.ingredientsSteps,
  });

  factory StepCooking.fromRawJson(String str) => StepCooking.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StepCooking.fromJson(Map<String, dynamic> json) => StepCooking(
    image: json["image"],
    description: json["description"],
    utensiliosSteps: json["utensilios_steps"] == null ? [] : List<Utensil>.from(json["utensilios_steps"]!.map((x) => Utensil.fromJson(x))),
    ingredientsSteps: json["ingredients_steps"] == null ? [] : List<Ingredient>.from(json["ingredients_steps"]!.map((x) => Ingredient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "description": description,
    "utensilios_steps": utensiliosSteps == null ? [] : List<dynamic>.from(utensiliosSteps!.map((x) => x.toJson())),
    "ingredients_steps": ingredientsSteps == null ? [] : List<dynamic>.from(ingredientsSteps!.map((x) => x.toJson())),
  };
}

class Utensil {
  String? name;

  Utensil({
    this.name,
  });

  factory Utensil.fromRawJson(String str) => Utensil.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Utensil.fromJson(Map<String, dynamic> json) => Utensil(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}