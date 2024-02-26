import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/widgets/custom_button.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_text_field.dart';

class MobileAccountSettingScreen extends StatelessWidget {
  const MobileAccountSettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, controller, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildMobileHeader(context),
                buildMobileProfileSection(context, controller),
                buildMobilePasswordSection(context, controller),
                buildMobileUpdateButton(context),
                const SizedBox(height: 25.0),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildMobileHeader(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account Settings",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: bluePrimary),
          ),
          SizedBox(height: 10.0),
          Text(
            "Edit or update your account settings",
            style: TextStyle(fontSize: 16.0, color: textGreyColor),
          ),
        ],
      ),
    );
  }

  Widget buildMobileProfileSection(
      BuildContext context, AuthProvider controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Profile",
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: blackPrimary),
          ),
          const SizedBox(height: 25.0),
          buildMobileProfilePhoto(context, controller),
          const SizedBox(height: 15.0),
          buildMobileProfileInfo(context, controller),
        ],
      ),
    );
  }

  Widget buildMobileProfilePhoto(
      BuildContext context, AuthProvider controller) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Profile Photo",
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: blackPrimary),
          ),
          const SizedBox(height: 15.0),
          GestureDetector(
            onTap: () {
              controller.pickImageFromFiles();
            },
            child: Container(
              width: double.infinity,
              height: 160.0,
              decoration: BoxDecoration(
                color: imagePickerColor.withOpacity(0.2),
                border: Border.all(color: greySecondary.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: controller.selectedImage != null
                  ? Image.memory(
                      controller.selectedImage!,
                      fit: BoxFit.cover,
                    )
                  : CustomImage(
                      image: Images.iconGallery,
                      width: 34.0,
                      height: 34.0,
                    ).center,
            ),
          ),
          const SizedBox(height: 15.0),
          CustomButton(
            buttonName: "Upload Photo",
            buttonColor: greenPrimary,
            borderColor: greenPrimary,
            onPressed: () {},
          ).center,
        ],
      ),
    );
  }

  Widget buildMobileProfileInfo(BuildContext context, AuthProvider controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: "First Name",
          controller: controller.firstNameController,
          hintText: "Name",
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20.0),
        CustomTextField(
          label: "Last Name",
          controller: controller.lastNameController,
          hintText: "Surname",
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20.0),
        CustomTextField(
          label: "Email Address",
          controller: controller.emailAddressController,
          hintText: "example@email.com",
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20.0),
        CustomButton(
          buttonTextColor: bluePrimary,
          buttonName: "Edit / Change Email Address",
          onPressed: () {},
          buttonColor: Colors.transparent,
          borderColor: bluePrimary,
        ).center,
      ],
    );
  }

  Widget buildMobilePasswordSection(
      BuildContext context, AuthProvider controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Change Password",
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: blackPrimary),
          ),
          const SizedBox(height: 25.0),
          CustomTextField(
            label: "Change Password",
            controller: controller.changePasswordController,
            hintText: "Password",
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20.0),
          CustomTextField(
            label: "Repeat Password",
            controller: controller.repeatPasswordController,
            hintText: "Password",
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20.0),
          CustomTextField(
            label: "Repeat New Password",
            controller: controller.repeatNewPasswordController,
            hintText: "Password",
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20.0),
          CustomButton(
            buttonColor: Colors.transparent,
            borderColor: bluePrimary,
            buttonTextColor: bluePrimary,
            buttonName: "Change Password",
            onPressed: () {},
          ).center,
        ],
      ),
    );
  }

  Widget buildMobileUpdateButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomButton(
        buttonName: "Update",
        onPressed: () {},
      ),
    ).center;
  }
}
