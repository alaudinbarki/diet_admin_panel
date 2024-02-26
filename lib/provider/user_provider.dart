// ignore_for_file: avoid_print

import 'package:base_code/data/model/custom_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/collection_string.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection(FireStoreCollectionString.user);
  List<UserModel> userList = [];

  Future<void> getUsers() async {
    try {
      setLoading(true);
      QuerySnapshot<Object?> userSnapshot = await _userCollection.get();
      print("🎉 GET [!!!!===> User <===!!!!] request successful!");

      userList.clear();

      for (QueryDocumentSnapshot<Object?> userDoc in userSnapshot.docs) {
        UserModel user = UserModel.fromSnapshot(userDoc);

        CollectionReference entriesCollectionRef =
            userDoc.reference.collection('entries');
        QuerySnapshot<Object?> entriesSnapshot =
            await entriesCollectionRef.get();
        if (entriesSnapshot.docs.isNotEmpty) {
          List<HealthEntry> entries = entriesSnapshot.docs
              .map((entryDoc) => HealthEntry.fromSnapshot(entryDoc))
              .toList();
          user.healthEntry = entries;
        }
        userList.add(user);
      }
      setLoading(false);
      // notifer();
    } catch (e) {
      print("❌ GET [!!!!===> User <===!!!!] request failed: $e");
      setLoading(false);
    } finally {
      setLoading(false);
    }
  }

  setLoading(bool value) {
    isLoading = value;
    notifer();
  }

  notifer() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }
}
