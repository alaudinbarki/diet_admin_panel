import 'package:cloud_firestore/cloud_firestore.dart';

class AdminDataModel {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String picture;
  final String role;
  final String uid;

  AdminDataModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.picture,
    required this.role,
    required this.uid,
  });

  // Factory constructor to create class instance from snapshot
  factory AdminDataModel.fromSnapshot(DocumentSnapshot<Object?> snapshot) {
    return AdminDataModel(
      email: snapshot.get('Email'),
      firstName: snapshot.get('FirstName'),
      lastName: snapshot.get('LastName'),
      password: snapshot.get('Password'),
      picture: snapshot.get('Picture'),
      role: snapshot.get('Role'),
      uid: snapshot.get('Uid'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'picture': picture,
      'role': role,
      'uid': uid,
    };
  }
}
