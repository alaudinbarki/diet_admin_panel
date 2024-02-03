import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  //Search controller
  TextEditingController searchController = TextEditingController();
  TextEditingController pasteLinkController = TextEditingController();

  bool? searchTapped;
  bool isPriceTrack = false;
  bool isAvailabilityTrack = false;

  setSearchTapped(bool value) {
    searchTapped = value;
    notifyListeners();
  }
  // Set Price tracking switch
  setPriceTrack() {
    isPriceTrack = !isPriceTrack;
    notifyListeners();
  }
// Set Availability tracking switch
  setAvailabilityTrack() {
    isAvailabilityTrack = !isAvailabilityTrack;
    notifyListeners();
  }
  // Reset item Add/update
  resetItemForm(){
    isPriceTrack = false;
    isAvailabilityTrack = false;
    pasteLinkController.clear();
    notifyListeners();
  }
}
