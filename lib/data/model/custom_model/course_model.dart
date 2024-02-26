import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  final String image;
  final String title;
  final DateTime uploadDate;
  final String totalEnroll;
  final String activeEnroll;
  final String accessPeriod;
  final DateTime startDate;
  final String shortDescription;
  final String pricing;
  final String discountedPrice;
  final DateTime discountStartDate;
  final DateTime discountEndDate;
  final List<ModuleUpdate> modules;
  final DateTime createdAt;

  CourseModel({
    required this.image,
    required this.title,
    required this.uploadDate,
    required this.totalEnroll,
    required this.activeEnroll,
    required this.accessPeriod,
    required this.startDate,
    required this.shortDescription,
    required this.pricing,
    required this.discountedPrice,
    required this.discountStartDate,
    required this.discountEndDate,
    required this.modules,
    required this.createdAt,
  });

  // Method to create RecipeModel from DocumentSnapshot
  factory CourseModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CourseModel(
      image: snapshot['image'],
      title: snapshot['title'],
      uploadDate: (snapshot['uploadDate'] as Timestamp).toDate(),
      totalEnroll: snapshot['totalEnroll'],
      activeEnroll: snapshot['activeEnroll'],
      accessPeriod: snapshot['accessPeriod'],
      startDate: (snapshot['startDate'] as Timestamp).toDate(),
      shortDescription: snapshot['shortDescription'],
      pricing: snapshot['pricing'],
      discountedPrice: snapshot['discountedPrice'],
      discountStartDate: (snapshot['discountStartDate'] as Timestamp).toDate(),
      discountEndDate: (snapshot['discountEndDate'] as Timestamp).toDate(),
      modules: (snapshot['modules'] as List<dynamic>)
          .map((module) => ModuleUpdate.fromMap(module))
          .toList(),
      createdAt: (snapshot['createdAt'] as Timestamp).toDate(),
    );
  }

  // Method to convert RecipeModel to Map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'uploadDate': uploadDate,
      'totalEnroll': totalEnroll,
      'activeEnroll': activeEnroll,
      'accessPeriod': accessPeriod,
      'startDate': startDate,
      'shortDescription': shortDescription,
      'pricing': pricing,
      'discountedPrice': discountedPrice,
      'discountStartDate': discountStartDate,
      'discountEndDate': discountEndDate,
      'modules': modules.map((module) => module.toMap()).toList(),
      'createdAt': createdAt,
    };
  }
}

class Module {
  String id;
  String moduleName;
  String status;
  List<Lesson> lessons;

  Module({
    required this.id,
    required this.moduleName,
    required this.status,
    required this.lessons,
  });
}

class ModuleUpdate {
  String id;
  String moduleName;
  String status;
  List<LessonUpdate> lessons;

  ModuleUpdate({
    required this.id,
    required this.moduleName,
    required this.status,
    required this.lessons,
  });

  factory ModuleUpdate.fromMap(Map<String, dynamic> map) {
    return ModuleUpdate(
      id: map['id'],
      moduleName: map['moduleName'],
      status: map['status'],
      lessons: (map['lessons'] as List<dynamic>)
          .map((lesson) => LessonUpdate.fromMap(lesson))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'moduleName': moduleName,
      'status': status,
      'lessons': lessons.map((lesson) => lesson.toMap()).toList(),
    };
  }
}

class Lesson {
  final String title;
  final String moduleId;
  final Uint8List? mediaLink;
  final String mediaType;
  final String description;
  final String status;
  final List<dynamic> downloadFile;

  Lesson({
    required this.title,
    required this.moduleId,
    required this.mediaLink,
    required this.mediaType,
    required this.description,
    required this.downloadFile,
    required this.status,
  });
}

class LessonUpdate {
  final String title;
  final String moduleId;
  final String? mediaLink;
  final String mediaType;
  final String description;
  final String status;
  final List<dynamic> downloadFile;

  LessonUpdate({
    required this.title,
    required this.moduleId,
    required this.mediaLink,
    required this.mediaType,
    required this.description,
    required this.downloadFile,
    required this.status,
  });

  factory LessonUpdate.fromMap(Map<String, dynamic> map) {
    return LessonUpdate(
      title: map['title'],
      moduleId: map['moduleId'],
      mediaLink: map['mediaLink'],
      mediaType: map['mediaType'],
      description: map['description'],
      downloadFile: map['downloadFile'] ?? [],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'moduleId': moduleId,
      'mediaLink': mediaLink,
      'mediaType': mediaType,
      'description': description,
      'downloadFile': downloadFile,
      "status": status,
    };
  }
}
