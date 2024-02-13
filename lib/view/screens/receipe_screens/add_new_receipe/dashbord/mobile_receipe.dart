// ignore_for_file: must_be_immutable

import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/custom_text_field.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/model/custom_model/tab_item_model.dart';
import '../../../../../provider/recepie_provider.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/mobile_category_header.dart';
import '../../../dashboard/components/custom_drawer.dart';

class MobNewReceipeWidget extends StatelessWidget {
  MobNewReceipeWidget({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: whitePrimary,
      drawer: CustomDrawer(
        fromMobile: true,
      ),
      appBar: AppBar(
        // toolbarHeight: 50.h,
        backgroundColor: whitePrimary,
        leading: Icon(
          Icons.menu,
          color: bluePrimary,
          size: 20.w,
        ).onPress(() {
          scaffoldKey.currentState!.openDrawer();
        }),
        actions: const [],
      ),
      body: Consumer2<RecepieProvider, AuthProvider>(
        builder: (context, controller, controller2, child) {
          return SingleChildScrollView(
            controller: scrollController,
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
                        "Add New Recipe".toText(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        "Create or edit recipe"
                            .toText(fontSize: 12, color: textGreyColor),
                      ],
                    ),
                    Row(
                      children: [
                        "Save to drafts".toText(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        20.width,
                        CustomButton(
                          width: 100.w,
                          buttonName: "Upload ",
                          buttonColor: bluePrimary,
                          borderColor: bluePrimary,
                          onPressed: () {},
                        ).center,
                      ],
                    )
                  ],
                ).paddingSymmetric(vertical: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: controller.selectedLanguagesList
                      .asMap()
                      .entries
                      .map((entry) {
                    int idx = entry.key;
                    TabItem title = entry.value;
                    bool isSelected = controller.selectedAddNewLanguage == idx;
                    return InkWell(
                      onTap: () {
                        controller.selectedAddNewLanguage = idx;
                        controller.notifer();
                      },
                      child: Row(
                        children: [
                          isSelected
                              ? title.label.toText(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: purplePrimary)
                              : title.label.toText(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: greyDark),
                          10.width,
                          title.count.isNotEmpty
                              ? Container(
                                  decoration: isSelected
                                      ? BoxDecoration(
                                          color:
                                              purplePrimary, // Selected tab background color
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        )
                                      : BoxDecoration(
                                          color:
                                              blueSecondary, // Selected tab background color
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                  child: title.count
                                      .toText(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: whitePrimary)
                                      .paddingSymmetric(
                                          vertical: 3.h, horizontal: 4.w),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                30.height,
                Container(
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      borderRadius: BorderRadius.circular(30.h)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Recipe Details".toText(
                          fontSize: 20,
                          color: blackPrimary,
                          fontWeight: FontWeight.w600),
                      25.height,
                      SizedBox(
                        width: 220.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Photo".toText(
                                fontSize: 16,
                                color: blackPrimary,
                                fontWeight: FontWeight.w600),
                            15.webHeight(context),
                            Container(
                                    width: 320.w,
                                    height: 260.h,
                                    decoration: BoxDecoration(
                                        color:
                                            imagePickerColor.withOpacity(0.2),
                                        border: Border.all(
                                            color:
                                                greySecondary.withOpacity(0.2)),
                                        borderRadius:
                                            BorderRadius.circular(15.h)),
                                    child: controller2.selectedImage != null
                                        ? Image.memory(
                                            controller2.selectedImage!,
                                            fit: BoxFit.cover,
                                          )
                                        : CustomImage(
                                            image: Images.iconGallery,
                                            width: 34.w,
                                            height: 34.h,
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
                              width: 100.w,
                              height: 40.h,
                              radius: 15.h,
                            ).align(Alignment.centerRight)
                          ],
                        ),
                      ),
                      30.webWidth(context),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.height,
                          CustomTextField(
                            height: 50.h,
                            width: 420.w,
                            label: "Recipe Title",
                            radius: 8.h,
                            controller: controller2.firstNameController,
                            hintText: "Ginger and Apple Water",
                            textInputAction: TextInputAction.next,
                          ).paddingOnly(bottom: 20.h),
                          CustomTextField(
                            height: 50.h,
                            width: 420.w,
                            label: "Upload Date",
                            radius: 8.h,
                            controller: controller2.lastNameController,
                            hintText: "Upload Date",
                            textInputAction: TextInputAction.next,
                          ).paddingOnly(bottom: 20.h),
                        ],
                      ),
                      15.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            height: 50.h,
                            width: 420.w,
                            label: "Upload Date",
                            radius: 8.h,
                            controller: controller2.emailAddressController,
                            hintText: "Select Date",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          ).paddingOnly(bottom: 20.h),
                          15.height,
                          "Total Likes".toText(
                              fontSize: 16,
                              color: blackPrimary,
                              fontWeight: FontWeight.w600),
                          15.height,
                          CustomButton(
                            buttonName: "4 781 Likes",
                            onPressed: () {},
                            width: 105.w,
                            height: 50.h,
                            buttonColor: Colors.transparent,
                            borderColor: pinkPrimary,
                            buttonTextColor: womenLineColor,
                            radius: 15.h,
                            textSize: 16,
                          )
                        ],
                      ),
                      15.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Primary Category".toText(
                              fontSize: 16,
                              color: blackPrimary,
                              fontWeight: FontWeight.w600),
                          16.height,
                          Container(
                            height: 57.h,
                            width: 420.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.h),
                                border: Border.all(
                                  color: greyLight, // Color of the border
                                  width: 1, // Width of te border
                                )),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: controller.dropdownValue,
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
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
                                    child: value.toText(
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
                      34.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Additional Category".toText(
                              fontSize: 16,
                              color: blackPrimary,
                              fontWeight: FontWeight.w600),
                          16.height,
                          Container(
                            height: 57.h,
                            width: 420.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.h),
                                border: Border.all(
                                  color: greyLight, // Color of the border
                                  width: 1, // Width of the border
                                )),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                padding: EdgeInsets.symmetric(horizontal: 10.h),
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
                                    child: value.toText(
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
                      15.height,
                    ],
                  ),
                ).paddingOnly(bottom: 25.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 700.w,
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        border: Border.all(color: borderColor, width: 1.h),
                        borderRadius: BorderRadius.circular(16.h)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        25.height,
                        "Ingredients"
                            .toText(
                                fontSize: 20,
                                color: blackPrimary,
                                fontWeight: FontWeight.w600)
                            .paddingOnly(left: 40.h),
                        30.webHeight(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: const MobileCategoryHeader(
                                title: 'Amount / Qty',
                                imagePath: null,
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: const MobileCategoryHeader(
                                title: 'Unit of measure',
                                imagePath: null,
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: const MobileCategoryHeader(
                                title: 'Ingredient name',
                                imagePath: null,
                              ),
                            ),
                            SizedBox(
                              width: 150.w,
                              child: const MobileCategoryHeader(
                                title: 'Ingredient notes',
                                imagePath: null,
                              ),
                            ),
                          ],
                        ).paddingOnly(left: 40.h),
                        Container(
                          height: 1.webH(context),
                          color: dividerColor,
                        ).paddingSymmetric(vertical: 20.w),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  index == 2
                                      ? Row(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Image.asset(
                                                Images.moveAlt,
                                                height: 24.h,
                                                width: 24.w,
                                              ),
                                            ),
                                            3.webScaleWidth(context),
                                            CustomTextField(
                                              height: 50.h,
                                              width: 400.w,
                                              radius: 8.h,
                                              controller:
                                                  TextEditingController(),
                                              hintText: "Ingredient heading",
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                  index != 2
                                      ? Row(
                                          children: [
                                            Row(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Image.asset(
                                                    Images.moveAlt,
                                                    height: 24.h,
                                                    width: 24.w,
                                                  ),
                                                ),
                                                3.width,
                                                CustomTextField(
                                                  height: 50.h,
                                                  width: 120.w,
                                                  radius: 8.h,
                                                  controller:
                                                      TextEditingController(),
                                                  hintText: "2",
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                              ],
                                            ),
                                            3.width,
                                            CustomTextField(
                                              height: 50.h,
                                              width: 120.w,
                                              radius: 8.h,
                                              controller:
                                                  TextEditingController(),
                                              hintText: "tbsp",
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            24.webScaleWidth(context),
                                            CustomTextField(
                                              height: 50.h,
                                              width: 180.w,
                                              radius: 8.h,
                                              controller:
                                                  TextEditingController(),
                                              hintText: "Olive oil",
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            24.webScaleWidth(context),
                                            Row(
                                              children: [
                                                CustomTextField(
                                                  height: 50.h,
                                                  width: 180.w,
                                                  radius: 8.h,
                                                  controller:
                                                      TextEditingController(),
                                                  hintText: "extra virgin",
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                                3.width,
                                                const Icon(Icons
                                                    .delete_outline_outlined)
                                              ],
                                            ),
                                          ],
                                        )
                                      : const SizedBox.shrink()
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                height: 1.h,
                                // color: dividerColor,
                              ).paddingSymmetric(vertical: 20.h);
                            },
                            itemCount: 3),
                        30.height,
                        Row(
                          children: [
                            WebCustomButton(
                              buttonName: "Add ingredient",
                              buttonTextColor: whitePrimary,
                              onPressed: () {},
                              width: 120.w,
                              height: 55.h,
                              radius: 15.h,
                              buttonColor: babyPink,
                              borderColor: babyPink,
                            ),
                            45.width,
                            WebCustomButton(
                              buttonName: "Add ingredient heading",
                              buttonTextColor: whitePrimary,
                              onPressed: () {},
                              width: 120.w,
                              height: 55.h,
                              radius: 15.h,
                              buttonColor: litePurple,
                              borderColor: litePurple,
                            ),
                          ],
                        ),
                        49.webHeight(context),
                      ],
                    ).paddingAll(18.h),
                  ),
                ),
                45.height,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 700.w,
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        border: Border.all(
                            color: borderColor, width: 1.webT(context)),
                        borderRadius: BorderRadius.circular(16.webT(context))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        25.height,
                        "Method"
                            .toText(
                                fontSize: 20,
                                color: blackPrimary,
                                fontWeight: FontWeight.w600)
                            .paddingOnly(left: 40.w),
                        20.height,
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          Images.moveAlt,
                                          height: 24.h,
                                          width: 24.w,
                                        ),
                                      ),
                                      3.webScaleWidth(context),
                                      CustomTextField(
                                        height: 50.h,
                                        width: 600.w,
                                        radius: 8.h,
                                        controller: TextEditingController(),
                                        hintText: "Ingredient heading",
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                height: 1.h,
                                // color: dividerColor,
                              ).paddingSymmetric(vertical: 20.h);
                            },
                            itemCount: 3),
                        30.webHeight(context),
                        Row(
                          children: [
                            WebCustomButton(
                              buttonName: "Add ingredient",
                              buttonTextColor: whitePrimary,
                              onPressed: () {},
                              width: 120.w,
                              height: 55.h,
                              radius: 15.h,
                              buttonColor: babyPink,
                              borderColor: babyPink,
                            ),
                            45.webScaleWidth(context),
                            WebCustomButton(
                              buttonName: "Add ingredient heading",
                              buttonTextColor: whitePrimary,
                              onPressed: () {},
                              width: 120.w,
                              height: 55.h,
                              radius: 15.h,
                              buttonColor: litePurple,
                              borderColor: litePurple,
                            ),
                          ],
                        ),
                        40.webHeight(context),
                      ],
                    ).paddingAll(18.webT(context)),
                  ),
                ),
                45.height,
                Container(
                  width: 700.w,
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      border: Border.all(
                          color: borderColor, width: 1.webT(context)),
                      borderRadius: BorderRadius.circular(16.webT(context))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Recipe Notes".toText(
                          fontSize: 16,
                          color: blackPrimary,
                          fontWeight: FontWeight.w600),
                      15.height,
                      Container(
                        height: 150.h,
                        width: 700.w,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(13.webT(context)),
                            border: Border.all(color: containerBorderColor)),
                      ),
                    ],
                  ).paddingAll(20.h),
                ),
                45.height,
                WebCustomButton(
                  buttonName: "Publish",
                  onPressed: () {},
                  borderColor: purplePrimary,
                  buttonColor: purplePrimary,
                  width: 206.w,
                  height: 50.h,
                  radius: 15.h,
                ).align(Alignment.centerLeft),
                20.height,
              ],
            ).paddingSymmetric(
              horizontal: 45.w,
            ),
          );
        },
      ),
    );
  }
}
