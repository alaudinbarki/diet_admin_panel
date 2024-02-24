import 'dart:typed_data';

import 'package:base_code/provider/utils_provider.dart';
import 'package:base_code/utils/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../data/model/custom_model/admin_data_model.dart';
import '../helper/routes_helper.dart';
import '../utils/collection_string.dart';

class AuthProvider extends UtilProvider {
  final CollectionReference _adminCollection =
      FirebaseFirestore.instance.collection(FireStoreCollectionString.admin);
  AdminDataModel? adminData;
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
  bool loading = false;

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

/////Firebase Sign In
  Future<void> signIn({required BuildContext context}) async {
    setLoading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: signInEmailController.text,
              password: signInPasswordController.text);
      if (userCredential.user != null && userCredential.user?.uid != null) {
        if (context.mounted) {
          await getAdminData(context, userCredential.user!.uid);
        }
      }
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'user-not-found') {
        if (context.mounted) {
          ShowToasts.showError(
              context: context,
              title: "User Not Found",
              message: 'No user found for that email.');
        }
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        if (context.mounted) {
          ShowToasts.showError(
              context: context,
              title: "Wrong Password",
              message: 'Wrong password provided for that user.');
        }
        print('Wrong password provided for that user.');
      } else {
        if (context.mounted) {
          ShowToasts.showError(
              context: context,
              title: "Error",
              message: 'Something went wrong!');
        }
        print(
            '====================<SIGN IN ERROR>=============<> ${e.message} <>=========================<SIGN IN ERROR>');
      }
    }
  }

  Future getAdminData(BuildContext context, String uid) async {
    try {
      // QuerySnapshot<Object?> value = await _adminCollection.get();
      // print("🎉 GET [!!!!===> Admin Data <===!!!!] request successful!");
      // adminData = AdminDataModel.fromSnapshot(value.docs);
      DocumentSnapshot<Object?> documentSnapshot =
          await _adminCollection.doc(uid).get();
      print("🎉 GET [!!!!===> Admin Data <===!!!!] request successful!");
      adminData = AdminDataModel.fromSnapshot(documentSnapshot);

      if (adminData != null) {
        if (adminData?.role == "Admin") {
          firstNameController =
              TextEditingController(text: adminData!.firstName);
          lastNameController = TextEditingController(text: adminData!.lastName);
          emailAddressController =
              TextEditingController(text: adminData!.email);

          setLoading(false);
          if (context.mounted) {
            ShowToasts.showSuccessToast(
                title: "Success!",
                message: 'You have signed up successfully',
                context: context);
            Navigator.pushNamed(context, RouterHelper.dashboardScreen);
          }
        }
      } else {
        if (context.mounted) {
          ShowToasts.showSuccessToast(
              title: "Error!",
              message: 'Something went wrong!',
              context: context);
        }
      }
      notifyListeners();
    } catch (e) {
      print("❌ GET [!!!!===> Admin Data <===!!!!] request failed: $e");
    } finally {
      setLoading(false);
    }
  }

  Future uploadImage(
    BuildContext context,
  ) async {
    Reference imageRef = FirebaseStorage.instance
        .ref()
        .child('admin_profile_picture')
        .child('/${DateTime.now().millisecondsSinceEpoch}');
    try {
      if (selectedImage != null) {
        var metadata = SettableMetadata(
          contentType: "image/jpeg",
        );
        await imageRef.putData(selectedImage!, metadata).whenComplete(() async {
          final String url = await imageRef.getDownloadURL();
          _adminCollection.doc(adminData!.uid).update({"Picture": url});
          ShowToasts.showSuccessToast(
              title: "Successful !",
              message: "Picture successfully upload",
              context: context);
          selectedImage = null;
          // ShowSnack.showToast("File Uploaded...");
        });
      } else {
        ShowToasts.showInfo(
            title: "Required *",
            message: "Please Select Image",
            context: context);
      }
    } on FirebaseException catch (e) {
      ShowToasts.showInfo(
          title: "Error", message: "Something went wrong", context: context);
      print(
          "<==============Upload Profile Picture Error=====$e====================>");
    }
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  pickImageFromFiles() async {
    selectedImage = await pickImage();
    notifyListeners();
  }
}
