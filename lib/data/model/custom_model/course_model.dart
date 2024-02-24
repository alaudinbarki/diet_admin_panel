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
  final List<Module> modules;
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
          .map((module) => Module.fromMap(module))
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

  factory Module.fromMap(Map<String, dynamic> map) {
    return Module(
      id: map['id'],
      moduleName: map['moduleName'],
      status: map['status'],
      lessons: (map['lessons'] as List<dynamic>)
          .map((lesson) => Lesson.fromMap(lesson))
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
  String title;
  String moduleId;
  String mediaLink;
  String mediaType;
  String description;
  List<dynamic> downloadFile;

  Lesson({
    required this.title,
    required this.moduleId,
    required this.mediaLink,
    required this.mediaType,
    required this.description,
    required this.downloadFile,
  });

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      title: map['title'],
      moduleId: map['moduleId'],
      mediaLink: map['mediaLink'],
      mediaType: map['mediaType'],
      description: map['description'],
      downloadFile: map['downloadFile'] ?? [],
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
    };
  }
}
