import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecipeCategoryModel {
  final Timestamp createdAt;
  final String id;
  final String nameAfr;
  final String nameEn;

  RecipeCategoryModel(
      {required this.createdAt,
      required this.id,
      required this.nameAfr,
      required this.nameEn});
  Map<String, dynamic> toMap() {
    return {
      'CreatedAt': createdAt,
      'Id': id,
      'NameAfr': nameAfr,
      'NameEn': nameEn,
    };
  }

  // Method to create class instance from map
  RecipeCategoryModel.fromSnapshot(DocumentSnapshot snapshot)
      : createdAt = snapshot.get('CreatedAt'),
        id = snapshot.get('Id'),
        nameAfr = snapshot.get('NameAfr'),
        nameEn = snapshot.get('NameEn');

  toTextWeb(
      {required BuildContext context,
      required int fontSize,
      required Color color,
      required FontWeight fontWeight}) {}
}
