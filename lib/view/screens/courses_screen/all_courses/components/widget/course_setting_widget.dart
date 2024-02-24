import 'package:base_code/data/model/custom_model/recipe_category_model.dart';
import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/recepie_provider.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../widgets/web_widgets/web_text_field.dart';

class CourseSettingWidget extends StatelessWidget {
  const CourseSettingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<RecepieProvider, AuthProvider>(
        builder: (context, controller, controller2, child) {
      return Container(
        decoration: BoxDecoration(
            color: whitePrimary,
            border: Border.all(color: borderColor, width: 1.webT(context)),
            borderRadius: BorderRadius.circular(16.webT(context))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.webHeight(context),
            Container(
              decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(30.webT(context))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Course Settings".toTextWeb(
                      context: context,
                      fontSize: 22,
                      color: blackPrimary,
                      fontWeight: FontWeight.w600),
                  25.webHeight(context),
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
                              child: DropdownButton<RecipeCategoryModel>(
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

                                onChanged: (newValue) {
                                  controller.dropdownValue = newValue!;
                                  controller.notifer();
                                },
                                items: controller.recipeCategoryList
                                    .map<DropdownMenuItem<RecipeCategoryModel>>(
                                        (value) {
                                  return DropdownMenuItem<RecipeCategoryModel>(
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
                    ],
                  ),
                  24.webHeight(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WebTextField(
                        height: 57.webT(context),
                        width: 420.webW(context),
                        label: "Bulk Discount %",
                        isLabelBold: true,
                        radius: 15.webT(context),
                        controller: TextEditingController(),
                        hintText: "Percentage to discount all courses",
                        textInputAction: TextInputAction.next,
                      ),
                      WebTextField(
                        height: 57.webT(context),
                        width: 420.webW(context),
                        label: "Start Date",
                        isLabelBold: true,
                        radius: 15.webT(context),
                        suffixIcon: const Icon(Icons.calendar_month),
                        controller: TextEditingController(),
                        hintText: "Select Date",
                        textInputAction: TextInputAction.next,
                      ),
                      WebTextField(
                        height: 57.webT(context),
                        width: 420.webW(context),
                        label: "Select Date",
                        isLabelBold: true,
                        radius: 15.webT(context),
                        suffixIcon: const Icon(Icons.calendar_month),
                        controller: TextEditingController(),
                        hintText: "End Date",
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  )
                ],
              ).paddingSymmetric(horizontal: 52.webW(context), vertical: 30.h),
            ).paddingOnly(bottom: 25.webT(context)),
            30.webHeight(context),
          ],
        ).paddingAll(18.webT(context)),
      ).paddingSymmetric(horizontal: 48.webW(context));
    });
  }
}
