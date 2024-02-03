import 'dart:typed_data';

import 'package:base_code/provider/utils_provider.dart';
import 'package:flutter/material.dart';

class AuthProvider extends UtilProvider {
  // Sign up controller
  TextEditingController signUpUserNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  // Sign in Controller

  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  // Reset password controller
  TextEditingController resetPasswordController = TextEditingController();

  //
  TextEditingController forgotPasswordController = TextEditingController();

  // Otp controller
  TextEditingController otpController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController changePasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController repeatNewPasswordController = TextEditingController();

  Uint8List? selectedImage;

  bool isVisible = false;
  bool? isPhoneValid;
  String? phoneValidText;
  bool? otpReceived;
  bool isValidSignInEmail = false;
  bool isValidSignUpEmail = false;
  bool isValidForgotEmail = false;
  bool isRememberMe = false;

  clearTextFields() {
    signUpUserNameController.clear();
    signUpEmailController.clear();
    signUpPasswordController.clear();
    signInEmailController.clear();
    signInPasswordController.clear();
    resetPasswordController.clear();
    forgotPasswordController.clear();
    otpController.clear();
    notifyListeners();
  }

  resetValidation() {
    isValidSignInEmail = false;
    isValidSignUpEmail = false;
    isValidForgotEmail = false;
    notifyListeners();
  }

  setOtpValidation(bool value) {
    otpReceived = value;
    notifyListeners();
  }

  passwordVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  setValidSignInEmail(bool value) {
    isValidSignInEmail = value;
    notifyListeners();
  }

  setValidSignUpEmail(bool value) {
    isValidSignUpEmail = value;
    notifyListeners();
  }

  setValidForgotEmail(bool value) {
    isValidForgotEmail = value;
    notifyListeners();
  }

  setRememberMe() {
    isRememberMe = !isRememberMe;
    notifyListeners();
  }
//=================================================================================

  pickImageFromFiles() async {
    selectedImage = await pickImage();
    notifyListeners();
  }
}
