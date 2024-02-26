import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

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
  final List<Methods> method;
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
      'allIngredients':
          allIngredients.map((ingredient) => ingredient.toMap()).toList(),
      'isPremium': isPremium,
      'languageCode': languageCode,
      'method': method.map((meth) => meth.toMap()).toList(),
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
        method = (snapshot.get('method') as List<dynamic>?)
                ?.map((methods) => Methods.fromJson(methods))
                .toList() ??
            [],
        //  snapshot.get('method'),
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
  final String amount;
  final String type;
  final String heading;

  Ingredients({
    required this.amount,
    required this.name,
    required this.unit,
    required this.notes,
    required this.type,
    required this.heading,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
      amount: json['amount'] ?? '0',
      name: json['name'],
      unit: json['unit'],
      notes: json['notes'],
      type: json['type'],
      heading: json['heading']);

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'name': name,
      'unit': unit,
      'notes': notes,
      "type": type,
      'heading': heading,
    };
  }
}

class Methods {
  final String type;
  final String method;

  Methods({
    required this.type,
    required this.method,
  });

  factory Methods.fromJson(Map<String, dynamic> json) => Methods(
        type: json['type'],
        method: json['method'],
      );

  Map<String, dynamic> toMap() {
    return {'type': type, 'method': method};
  }
}

class RecipeMethods {
  late String instructionType;
  late TextEditingController instructionName;

  RecipeMethods({
    required String type,
    required String instruction,
  }) {
    instructionType = type;
    instructionName = TextEditingController(text: instruction);
  }
}

class IngredientTextEditor {
  final TextEditingController amountController;
  final TextEditingController unitController;
  final TextEditingController nameController;
  final TextEditingController notesController;
  final String type;
  final TextEditingController ingredientHeading;

  IngredientTextEditor({
    required this.amountController,
    required this.unitController,
    required this.nameController,
    required this.notesController,
    required this.type,
    required this.ingredientHeading,
  });
}
