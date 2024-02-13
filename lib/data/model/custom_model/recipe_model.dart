import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class RecipeModel {
  final String afrID;
  final List<String> categoryList;
  final String engID;
  final List<String> favouritedBy;
  final String headerImage;
  final String id;
  final String ingredients;
  final Map<String, int> ingredientsMap;
  final List<Ingredients> allIngredients;
  final bool isPremium;
  final String languageCode;
  final String method;
  final String notes;
  final String title;
  final DateTime updateDate;
  final String author;
  final bool status;
  final String totalLikes;

  RecipeModel({
    required this.afrID,
    required this.categoryList,
    required this.engID,
    required this.favouritedBy,
    required this.headerImage,
    required this.id,
    required this.ingredients,
    required this.ingredientsMap,
    required this.allIngredients,
    required this.isPremium,
    required this.languageCode,
    required this.method,
    required this.notes,
    required this.title,
    required this.updateDate,
    required this.author,
    required this.status,
    required this.totalLikes,
  });

  // Method to convert class instance to a map
  Map<String, dynamic> toMap() {
    return {
      'afrID': afrID,
      'categoryList': categoryList,
      'engID': engID,
      'favouritedBy': favouritedBy,
      'headerImage': headerImage,
      'id': id,
      'ingredients': ingredients,
      'ingredientsMap': ingredientsMap,
      'allIngredients': allIngredients,
      'isPremium': isPremium,
      'languageCode': languageCode,
      'method': method,
      'notes': notes,
      'title': title,
      'updateDate': updateDate,
      'author': author,
      'status': status,
      'totalLikes': totalLikes,
    };
  }

  // Method to create class instance from map
  RecipeModel.fromSnapshot(DocumentSnapshot snapshot)
      : afrID = snapshot.get('afrID'),
        categoryList = List<String>.from(snapshot.get('categoryList') ?? []),
        engID = snapshot.get('engID'),
        favouritedBy = List<String>.from(snapshot.get('favouritedBy') ?? []),
        headerImage = snapshot.get('headerImage'),
        id = snapshot.get('id'),
        ingredients = snapshot.get('ingredients'),
        ingredientsMap =
            Map<String, int>.from(snapshot.get('ingredientsMap') ?? {}),
        allIngredients = (snapshot.get('allIngredients') as List<dynamic>?)
                ?.map((ingredientJson) => Ingredients.fromJson(ingredientJson))
                .toList() ??
            [],
        isPremium = snapshot.get('isPremium'),
        languageCode = snapshot.get('languageCode'),
        method = snapshot.get('method'),
        notes = snapshot.get('notes'),
        title = snapshot.get('title'),
        updateDate = (snapshot.get('updateDate') as Timestamp).toDate(),
        // != null ? (snapshot.get('updateDate') as Timestamp).toDate() : null,
        author = snapshot.get('author'),
        status = snapshot.get('status'),
        totalLikes = snapshot.get('totalLikes');
}

class Ingredients {
  final String notes;
  final String name;
  final String unit;
  final int amount;

  Ingredients({
    required this.amount,
    required this.name,
    required this.unit,
    required this.notes,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        amount: json['amount'],
        name: json['name'],
        unit: json['unit'],
        notes: json['notes'],
      );
}

class IngredientTextEditor {
  late TextEditingController amountController;
  late TextEditingController unitController;
  late TextEditingController nameController;
  late TextEditingController notesController;

  IngredientTextEditor({
    required String amount,
    required String unit,
    required String name,
    required String notes,
  }) {
    amountController = TextEditingController(text: amount);
    unitController = TextEditingController(text: unit);
    nameController = TextEditingController(text: name);
    notesController = TextEditingController(text: notes);
  }
}
