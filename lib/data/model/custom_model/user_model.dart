import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  List<HealthEntry>? healthEntry;
  final int age;
  final double averageDailyWeightLoss;
  final double averageWeeklyWeightLoss;
  final String configurationID;
  final double currentBMI;
  final double currentWeight;
  final int daysCompleted;
  final String email;
  final double height;
  final String gender;
  final String imageURL;
  final bool isPremium;
  final DateTime joinDate;
  final DateTime lastLogin;
  final String? latestEntry;
  final double lifeTime;
  final String name;
  final DateTime nextWeighingDate;
  final List<RecipeData> pendingApproval;
  final List<RecipeData> privateRecipes;
  final String? sex;
  final List<RecipeData> sharedRecipes;
  final double startDay;
  final double startMealDay;
  final double startingBMI;
  final double startingWeight;
  final String status;
  final double totalWeightLost;
  final String uid;

  UserModel({
    this.healthEntry,
    required this.age,
    required this.averageDailyWeightLoss,
    required this.averageWeeklyWeightLoss,
    required this.configurationID,
    required this.currentBMI,
    required this.currentWeight,
    required this.daysCompleted,
    required this.email,
    required this.height,
    required this.gender,
    required this.imageURL,
    required this.isPremium,
    required this.joinDate,
    required this.lastLogin,
    required this.latestEntry,
    required this.lifeTime,
    required this.name,
    required this.nextWeighingDate,
    required this.pendingApproval,
    required this.privateRecipes,
    required this.sex,
    required this.sharedRecipes,
    required this.startDay,
    required this.startMealDay,
    required this.startingBMI,
    required this.startingWeight,
    required this.status,
    required this.totalWeightLost,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      "entries": healthEntry,
      'age': age,
      'averageDailyWeightLoss': averageDailyWeightLoss,
      'averageWeeklyWeightLoss': averageWeeklyWeightLoss,
      'configurationID': configurationID,
      'currentBMI': currentBMI,
      'currentWeight': currentWeight,
      'daysCompleted': daysCompleted,
      'email': email,
      'height': height,
      'gender': gender,
      'imageURL': imageURL,
      'isPremium': isPremium,
      'joinDate': joinDate,
      'lastLogin': lastLogin,
      'latestEntry': latestEntry,
      'lifeTime': lifeTime,
      'name': name,
      'nextWeighingDate': nextWeighingDate,
      'pendingApproval': pendingApproval,
      'privateRecipes': privateRecipes,
      'sex': sex,
      'sharedRecipes': sharedRecipes,
      'startDay': startDay,
      'startMealDay': startMealDay,
      'startingBMI': startingBMI,
      'startingWeight': startingWeight,
      'status': status,
      'totalWeightLost': totalWeightLost,
      'uid': uid,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      // healthEntry:
      //     HealthEntry.fromSnapshot(snapshot['entries']) as List<HealthEntry>,
      age: snapshot.get('age'),
      averageDailyWeightLoss: snapshot.get('averageDailyWeightLoss'),
      averageWeeklyWeightLoss: snapshot.get('averageWeeklyWeightLoss'),
      configurationID: snapshot.get('configurationID'),
      currentBMI: snapshot.get('currentBMI'),
      currentWeight: snapshot.get('currentWeight'),
      daysCompleted: snapshot.get('daysCompleted'),
      email: snapshot.get('email'),
      height: snapshot.get('height'),
      gender: snapshot.get('gender'),
      imageURL: snapshot.get('imageURL'),
      isPremium: snapshot.get('isPremium'),
      joinDate: snapshot.get('joinDate').toDate(),
      lastLogin: snapshot.get('lastLogin').toDate(),
      latestEntry: snapshot.get('latestEntry'),
      lifeTime: snapshot.get('lifeTime'),
      name: snapshot.get('name'),
      nextWeighingDate: snapshot.get('nextWeighingDate').toDate(),
      pendingApproval: (snapshot.get('pendingApproval') as List<dynamic>?)
              ?.map((ingredientJson) => RecipeData.fromJson(ingredientJson))
              .toList() ??
          [],
      privateRecipes: (snapshot.get('privateRecipes') as List<dynamic>?)
              ?.map((ingredientJson) => RecipeData.fromJson(ingredientJson))
              .toList() ??
          [],
      sex: snapshot.get('sex'),
      sharedRecipes: (snapshot.get('sharedRecipes') as List<dynamic>?)
              ?.map((ingredientJson) => RecipeData.fromJson(ingredientJson))
              .toList() ??
          [],
      // RecipeData.fromJson(snapshot.get('sharedRecipes')),
      startDay: snapshot.get('startDay'),
      startMealDay: snapshot.get('startMealDay'),
      startingBMI: snapshot.get('startingBMI'),
      startingWeight: snapshot.get('startingWeight'),
      status: snapshot.get('status'),
      totalWeightLost: snapshot.get('totalWeightLost'),
      uid: snapshot.get('uid'),
    );
  }
}

class RecipeData {
  final String name;
  final String id;

  RecipeData({
    required this.name,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }

  factory RecipeData.fromJson(Map<String, dynamic> json) {
    return RecipeData(
      name: json['name'],
      id: json['id'],
    );
  }
}

class HealthEntry {
  final double bloodSugar;
  final double chest;
  final double diaBlood;
  final dynamic entryBodyImageURL;
  final double entryDate;
  final String entryFaceImageURL;
  final String entryID;
  final double hips;
  final String journalEntry;
  final double leftArm;
  final double leftCalf;
  final double leftThigh;
  final double neck;
  final String planDay;
  final double rightArm;
  final double rightCalf;
  final double rightThigh;
  final double sysBlood;
  final Timestamp timeStamp;
  final double waist;
  final double weight;

  HealthEntry({
    required this.bloodSugar,
    required this.chest,
    required this.diaBlood,
    required this.entryBodyImageURL,
    required this.entryDate,
    required this.entryFaceImageURL,
    required this.entryID,
    required this.hips,
    required this.journalEntry,
    required this.leftArm,
    required this.leftCalf,
    required this.leftThigh,
    required this.neck,
    required this.planDay,
    required this.rightArm,
    required this.rightCalf,
    required this.rightThigh,
    required this.sysBlood,
    required this.timeStamp,
    required this.waist,
    required this.weight,
  });

  factory HealthEntry.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return HealthEntry(
      bloodSugar: data['bloodSugar'] ?? 0,
      chest: data['chest'] ?? 0,
      diaBlood: data['diaBlood'] ?? 0,
      entryBodyImageURL: data['entryBodyImageURL'] ?? "",
      entryDate: data['entryDate'],
      entryFaceImageURL: data['entryFaceImageURL'] ?? "",
      entryID: data['entryID'] ?? "",
      hips: data['hips'] ?? 0,
      journalEntry: data['journalEntry'] ?? "",
      leftArm: data['leftArm'] ?? 0,
      leftCalf: data['leftCalf'] ?? 0,
      leftThigh: data['leftThigh'] ?? 0,
      neck: data['neck'] ?? 0,
      planDay: data['planDay'] ?? "",
      rightArm: data['rightArm'] ?? 0,
      rightCalf: data['rightCalf'] ?? 0,
      rightThigh: data['rightThigh'] ?? 0,
      sysBlood: data['sysBlood'] ?? 0,
      timeStamp: data['timeStamp'],
      waist: data['waist'] ?? 0,
      weight: data['weight'] ?? 0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'bloodSugar': bloodSugar,
      'chest': chest,
      'diaBlood': diaBlood,
      'entryBodyImageURL': entryBodyImageURL,
      'entryDate': entryDate,
      'entryFaceImageURL': entryFaceImageURL,
      'entryID': entryID,
      'hips': hips,
      'journalEntry': journalEntry,
      'leftArm': leftArm,
      'leftCalf': leftCalf,
      'leftThigh': leftThigh,
      'neck': neck,
      'planDay': planDay,
      'rightArm': rightArm,
      'rightCalf': rightCalf,
      'rightThigh': rightThigh,
      'sysBlood': sysBlood,
      'timeStamp': timeStamp,
      'waist': waist,
      'weight': weight,
    };
  }
}
