import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class UtilProvider extends ChangeNotifier {

  Future<Uint8List?> pickImage() async {
    Uint8List? image = await ImagePickerWeb.getImageAsBytes();
    return image;
  }

  Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      return picked;
    }
  }

}