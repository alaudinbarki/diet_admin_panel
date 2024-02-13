import 'package:base_code/data/model/custom_model/recipe_model.dart';
import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/screens/receipe_screens/components/detail_receipe_widget/widgets/ingrediants_receipe_widget.dart';
import 'package:base_code/view/screens/receipe_screens/components/detail_receipe_widget/widgets/method_rew_receipe_widet.dart';
import 'package:base_code/view/screens/receipe_screens/components/detail_receipe_widget/widgets/receipe_notes_widget.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_custom_button.dart';
import 'package:base_code/view/widgets/web_widgets/web_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/model/custom_model/tab_item_model.dart';
import '../../../../../provider/recepie_provider.dart';

class DetailReceipeWidget extends StatelessWidget {
  // final RecipeModel recipe;
  const DetailReceipeWidget({
    super.key,
    // required this.recipe
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1294.webH(context),
      color: backgroundColor,
      child: Consumer<RecepieProvider>(
        builder: (context, controller, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (controller.selectedAutherName != "Admin")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "Review User Recipe".toTextWeb(
                              context: context,
                              fontSize: 34,
                              fontWeight: FontWeight.w600,
                              color: bluePrimary),
                          "Approve or decline recipes submitted by app users"
                              .toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  color: textGreyColor),
                        ],
                      ),
                      Row(
                        children: [
                          20.webScaleWidth(context),
                          WebCustomButton(
                            buttonName: "Decline",
                            onPressed: () {},
                            width: 206.webT(context),
                            height: 45.webT(context),
                            buttonColor: redPrimary,
                            borderColor: redPrimary,
                            buttonTextColor: whitePrimary,
                            radius: 15.webT(context),
                          ),
                          30.webScaleWidth(context),
                          WebCustomButton(
                            buttonName: "Accept",
                            onPressed: () {},
                            buttonColor: greenPrimary,
                            borderColor: greenPrimary,
                            buttonTextColor: whitePrimary,
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
                                  width: 360.webW(context),
                                  height: 150.webT(context),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          onError: (exception, stackTrace) {
                                            print(
                                                "Error loading image: $exception");
                                          },
                                          image: NetworkImage(
                                              controller.photoPath ?? "")),
                                      color: imagePickerColor.withOpacity(0.2),
                                      border: Border.all(
                                          color:
                                              greySecondary.withOpacity(0.2)),
                                      borderRadius: BorderRadius.circular(
                                          15.webT(context))),
                                ).onPress(() {
                                  controller.pickImageFromFiles();
                                }),
                                15.webHeight(context),
                                WebCustomButton(
                                  buttonName: "Full View",
                                  onPressed: () {},
                                  borderColor: androidLineColor,
                                  buttonColor: androidLineColor,
                                  width: 160.webT(context),
                                  height: 40.webT(context),
                                  radius: 15.webT(context),
                                )
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
                                controller: controller.recipeTitle,
                                hintText: "Grilled Chicken Kebabs",
                                textInputAction: TextInputAction.next,
                              ).paddingOnly(bottom: 20.webH(context)),
                              WebTextField(
                                height: 50.webT(context),
                                width: 420.webW(context),
                                label: "Author",
                                isLabelBold: true,
                                radius: 8.webT(context),
                                controller: controller.autherName,
                                hintText: "Poppie van Staden",
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
                                controller: controller.recipeUpdateDate,
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
                                buttonName:
                                    "${controller.totalLikes.text} Likes",
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
                      90.webScaleHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WebTextField(
                            height: 50.webT(context),
                            width: 420.webW(context),
                            label: "Primary Category",
                            isLabelBold: true,
                            radius: 8.webT(context),
                            controller: TextEditingController(),
                            hintText: "Chicken & Salad/Vegetables",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          ).paddingOnly(bottom: 20.webH(context)),
                          WebTextField(
                            height: 50.webT(context),
                            width: 420.webW(context),
                            label: "Additional Categories",
                            isLabelBold: true,
                            radius: 8.webT(context),
                            controller: TextEditingController(),
                            hintText:
                                "Chicken & 1 Vegetable, Fish & Salad/Vegetables",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          ).paddingOnly(bottom: 20.webH(context)),
                          WebTextField(
                            height: 50.webT(context),
                            width: 420.webW(context),
                            label: "Upload Language",
                            isLabelBold: true,
                            radius: 8.webT(context),
                            controller: controller.uploadLang,
                            hintText: "Afrikaans",
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                          ).paddingOnly(bottom: 20.webH(context)),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(
                      horizontal: 52.webW(context), vertical: 30.h),
                ).paddingOnly(bottom: 25.webT(context)),
                IngrediantsDetailWidget(ingredients: controller.ingredients),
                25.webScaleHeight(context),
                MethodDetailReceipeWidget(methods: controller.methodText),
                25.webHeight(context),
                ReceipeNotesWidget(),
                45.webHeight(context),
                Row(
                  children: [
                    20.webScaleWidth(context),
                    WebCustomButton(
                      buttonName: "Decline",
                      onPressed: () {},
                      width: 206.webT(context),
                      height: 45.webT(context),
                      buttonColor: redPrimary,
                      borderColor: redPrimary,
                      buttonTextColor: whitePrimary,
                      radius: 15.webT(context),
                    ),
                    30.webScaleWidth(context),
                    WebCustomButton(
                      buttonName: "Publish",
                      onPressed: () {},
                      buttonColor: greenPrimary,
                      borderColor: greenPrimary,
                      buttonTextColor: whitePrimary,
                      width: 206.webT(context),
                      height: 45.webT(context),
                      radius: 15.webT(context),
                    ),
                  ],
                ),
                15.webHeight(context),
              ],
            ).paddingSymmetric(
              horizontal: 60.webT(context),
            ),
          );
        },
      ),
    );
  }
}
