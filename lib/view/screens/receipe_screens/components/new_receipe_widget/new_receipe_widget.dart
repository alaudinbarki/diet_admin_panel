import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/screens/receipe_screens/components/new_receipe_widget/widgets/ingrediants_receipe_widget.dart';
import 'package:base_code/view/screens/receipe_screens/components/new_receipe_widget/widgets/method_rew_receipe_widet.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_custom_button.dart';
import 'package:base_code/view/widgets/web_widgets/web_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/model/custom_model/tab_item_model.dart';
import '../../../../../provider/recepie_provider.dart';

class NewReceipeWidget extends StatelessWidget {
  const NewReceipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1294.webH(context),
      color: backgroundColor,
      child: Consumer2<RecepieProvider, AuthProvider>(
        builder: (context, controller, controller2, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Add New Recipe".toTextWeb(
                            context: context,
                            fontSize: 34,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        "Create or edit recipe".toTextWeb(
                            context: context,
                            fontSize: 16,
                            color: textGreyColor),
                      ],
                    ),
                    Row(
                      children: [
                        "Save to drafts".toTextWeb(
                            context: context,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        20.webScaleWidth(context),
                        WebCustomButton(
                          buttonName: "Update",
                          onPressed: () {},
                          width: 206.webT(context),
                          height: 45.webT(context),
                          radius: 15.webT(context),
                        ),
                      ],
                    )
                  ],
                ).paddingSymmetric(vertical: 25.webT(context)),
                Container(
                  decoration: BoxDecoration(
                    color: whitePrimary,
                    border: Border.all(
                      color: borderColor,
                      width: 1.webT(context),
                    ),
                    borderRadius: BorderRadius.circular(16.webT(context)),
                  ),
                  height: 115.webT(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: controller.selectedLanguagesList
                        .asMap()
                        .entries
                        .map((entry) {
                      int idx = entry.key;
                      TabItem title = entry.value;
                      bool isSelected =
                          controller.selectedAddNewLanguage == idx;
                      return InkWell(
                        onTap: () {
                          controller.selectedAddNewLanguage = idx;
                          controller.notifer();
                        },
                        child: Row(
                          children: [
                            isSelected
                                ? title.label.toTextWeb(
                                    context: context,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: purplePrimary)
                                : title.label.toTextWeb(
                                    context: context,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: greyDark),
                            10.webScaleWidth(context),
                            title.count.isNotEmpty
                                ? Container(
                                    decoration: isSelected
                                        ? BoxDecoration(
                                            color:
                                                purplePrimary, // Selected tab background color
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          )
                                        : BoxDecoration(
                                            color:
                                                blueSecondary, // Selected tab background color
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                    child: title.count
                                        .toTextWeb(
                                            context: context,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: whitePrimary)
                                        .paddingSymmetric(
                                            vertical: 3.webT(context),
                                            horizontal: 4.w),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ).paddingOnly(right: 15.webT(context)),
                      );
                    }).toList(),
                  ).paddingSymmetric(horizontal: 52.webW(context)),
                ).paddingOnly(bottom: 23.webH(context)),
                Container(
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.circular(30.webT(context))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Recipe Details".toTextWeb(
                          context: context,
                          fontSize: 22,
                          color: blackPrimary,
                          fontWeight: FontWeight.w600),
                      25.webHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 420.webW(context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Photo".toTextWeb(
                                    context: context,
                                    fontSize: 16,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w600),
                                15.webHeight(context),
                                Container(
                                        width: 420.webW(context),
                                        height: 260.webT(context),
                                        decoration: BoxDecoration(
                                            color: imagePickerColor
                                                .withOpacity(0.2),
                                            border: Border.all(
                                                color: greySecondary
                                                    .withOpacity(0.2)),
                                            borderRadius: BorderRadius.circular(
                                                15.webT(context))),
                                        child: controller2.selectedImage != null
                                            ? Image.memory(
                                                controller2.selectedImage!,
                                                fit: BoxFit.cover,
                                              )
                                            : CustomImage(
                                                image: Images.iconGallery,
                                                width: 34.webT(context),
                                                height: 34.webT(context),
                                              ).center)
                                    .onPress(() {
                                  controller2.pickImageFromFiles();
                                }),
                                15.webHeight(context),
                                WebCustomButton(
                                  buttonName: "Upload Photo",
                                  onPressed: () {},
                                  borderColor: greenPrimary,
                                  buttonColor: greenPrimary,
                                  width: 200.webT(context),
                                  height: 40.webT(context),
                                  radius: 15.webT(context),
                                ).align(Alignment.centerRight)
                              ],
                            ),
                          ),
                          30.webWidth(context),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WebTextField(
                                height: 50.webT(context),
                                width: 420.webW(context),
                                isLabelBold: true,
                                label: "Recipe Title",
                                radius: 8.webT(context),
                                controller: controller2.firstNameController,
                                hintText: "Ginger and Apple Water",
                                textInputAction: TextInputAction.next,
                              ).paddingOnly(bottom: 20.webH(context)),
                              WebTextField(
                                height: 50.webT(context),
                                width: 420.webW(context),
                                label: "Upload Date",
                                isLabelBold: true,
                                radius: 8.webT(context),
                                controller: controller2.lastNameController,
                                hintText: "Upload Date",
                                textInputAction: TextInputAction.next,
                              ).paddingOnly(bottom: 20.webH(context)),
                            ],
                          ),
                          30.webWidth(context),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WebTextField(
                                height: 50.webT(context),
                                width: 420.webW(context),
                                label: "Upload Date",
                                isLabelBold: true,
                                radius: 8.webT(context),
                                controller: controller2.emailAddressController,
                                hintText: "Select Date",
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.emailAddress,
                              ).paddingOnly(bottom: 20.webH(context)),
                              6.webScaleHeight(context),
                              // 15.webHeight(context),
                              "Total Likes".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  color: blackPrimary,
                                  fontWeight: FontWeight.w600),
                              6.webScaleHeight(context),

                              WebCustomButton(
                                buttonName: "4 781 Likes",
                                onPressed: () {},
                                width: 165.webW(context),
                                height: 50.webT(context),
                                buttonColor: Colors.transparent,
                                borderColor: pinkPrimary,
                                buttonTextColor: womenLineColor,
                                radius: 15.webT(context),
                                textSize: 16,
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Primary Category".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  color: blackPrimary,
                                  fontWeight: FontWeight.w600),
                              16.webHeight(context),
                              Container(
                                height: 57.webH(context),
                                width: 420.webW(context),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(15.webT(context)),
                                    border: Border.all(
                                      color: greyLight, // Color of the border
                                      width: 1, // Width of the border
                                    )),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: controller.dropdownValue,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.webT(context)),
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    elevation: 16,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: blackPrimary,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    onChanged: (String? newValue) {
                                      controller.dropdownValue = newValue!;
                                      controller.notifer();
                                    },
                                    items: controller.items
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: value.toTextWeb(
                                            context: context,
                                            fontSize: 16,
                                            color: blackPrimary,
                                            fontWeight: FontWeight.w500),
                                      );
                                    }).toList(),
                                    // Adding the rounded border by wrapping the DropdownButton with DecoratedBox
                                    dropdownColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          34.webScaleWidth(context),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Additional Category".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  color: blackPrimary,
                                  fontWeight: FontWeight.w600),
                              16.webHeight(context),
                              Container(
                                height: 57.webH(context),
                                width: 420.webW(context),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(15.webT(context)),
                                    border: Border.all(
                                      color: greyLight, // Color of the border
                                      width: 1, // Width of the border
                                    )),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.webT(context)),
                                    value: controller.additonalCategoriesValue,
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined),
                                    elevation: 16,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: blackPrimary,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    onChanged: (String? newValue) {
                                      controller.additonalCategoriesValue =
                                          newValue!;
                                      controller.notifer();
                                    },
                                    items: controller.additionalItems
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: value.toTextWeb(
                                            context: context,
                                            fontSize: 16,
                                            color: blackPrimary,
                                            fontWeight: FontWeight.w500),
                                      );
                                    }).toList(),
                                    // Adding the rounded border by wrapping the DropdownButton with DecoratedBox
                                    dropdownColor: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ).paddingSymmetric(
                      horizontal: 52.webW(context), vertical: 30.h),
                ).paddingOnly(bottom: 25.webT(context)),
                const IngrediantsRecepieWidget(),
                25.webScaleHeight(context),
                const MethodNewReceipeWidget(),
                45.webHeight(context),
                Container(
                  height: 261.webH(context),
                  width: 1450.webW(context),
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      border: Border.all(
                          color: borderColor, width: 1.webT(context)),
                      borderRadius: BorderRadius.circular(16.webT(context))),
                  child: Container(),
                ),
                45.webHeight(context),
                WebCustomButton(
                  buttonName: "Publish",
                  onPressed: () {},
                  borderColor: purplePrimary,
                  buttonColor: purplePrimary,
                  width: 206.webT(context),
                  height: 50.webT(context),
                  radius: 15.webT(context),
                ).align(Alignment.centerLeft),
                20.webHeight(context),
              ],
            ).paddingSymmetric(
              horizontal: 45.webT(context),
            ),
          );
        },
      ),
    );
  }
}
