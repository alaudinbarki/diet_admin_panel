// ignore_for_file: must_be_immutable, invalid_use_of_visible_for_testing_member

import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
// import 'package:base_code/view/screens/dashboard/components/custom_popup_menu.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_custom_button.dart';
import 'package:base_code/view/widgets/web_widgets/web_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../../../../../../helper/routes_helper.dart';
import '../../../../../../provider/authentication_provider.dart';

class UserDetailWidget extends StatelessWidget {
  UserDetailWidget({super.key});

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, controller, child) {
      return Container(
        height: 1294.webH(context),
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 120.webT(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "View User Profile".toTextWeb(
                            context: context,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        "Summary of single user profile".toTextWeb(
                            context: context, fontSize: 16, color: textColor),
                      ],
                    ),
                  ],
                ).paddingSymmetric(horizontal: 50.webW(context)),
              ),
              40.webScaleHeight(context),
              Container(
                decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(13.webT(context)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Profile Details".toTextWeb(
                        context: context,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: blackPrimary),
                    35.webScaleHeight(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 420.webT(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 150.webT(context),
                                width: 420.webT(context),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(13.webT(context)),
                                    border: Border.all(
                                        color: containerBorderColor)),
                              ),
                              15.webScaleHeight(context),
                              WebCustomButton(
                                  width: 150.webT(context),
                                  height: 40.webT(context),
                                  radius: 12.webT(context),
                                  buttonTextColor: whitePrimary,
                                  borderColor: blueSecondary,
                                  buttonColor: blueSecondary,
                                  buttonName: "Full View",
                                  onPressed: () {}),
                              50.webScaleHeight(context),
                              Container(
                                height: 425.webT(context),
                                width: 420.webT(context),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(13.webT(context)),
                                    border: Border.all(
                                        color: containerBorderColor)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 57.webT(context),
                                      width: 420.webT(context),
                                      decoration: BoxDecoration(
                                          color: containerShadowColor,
                                          borderRadius: BorderRadius.circular(
                                              13.webT(context)),
                                          border: const Border(
                                              bottom: BorderSide(
                                                  color:
                                                      containerBorderColor))),
                                      child: "Biographical Information"
                                          .toTextWeb(
                                              color: blackPrimary,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              context: context)
                                          .align(Alignment.centerLeft)
                                          .paddingSymmetric(
                                              horizontal: 20.webT(context)),
                                    ),
                                    35.webScaleHeight(context),
                                    renderingRow(context, "Email Address:",
                                        "francisp@omail.com"),
                                    renderingRow(context, "Gender:", "Female"),
                                    renderingRow(context, "Date of birth:",
                                        "15 June 1991"),
                                    renderingRow(context, "Age:", "33"),
                                    renderingRow(
                                        context, "Location:", "Cape Town"),
                                    renderingRow(
                                        context, "Country:", "South Africa"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 420.webT(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WebTextField(
                                controller:
                                    TextEditingController(text: "Francis Pugh"),
                                width: 420.webT(context),
                                height: 55.webT(context),
                                borderColor: containerBorderColor,
                              ),
                              35.webScaleHeight(context),
                              Container(
                                height: 115.webT(context),
                                width: 420.webT(context),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(13.webT(context)),
                                    border: Border.all(
                                        color: containerBorderColor)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 100.webT(context),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          "Status".toTextWeb(
                                              context: context,
                                              fontSize: 16,
                                              color: greenPrimary,
                                              fontWeight: FontWeight.w500),
                                          "Basic".toTextWeb(
                                              context: context,
                                              fontSize: 16,
                                              color: blackPrimary,
                                              fontWeight: FontWeight.w500)
                                        ],
                                      ).align(Alignment.center),
                                    ),
                                    SizedBox(
                                      width: 100.webT(context),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          "Platform".toTextWeb(
                                              context: context,
                                              fontSize: 16,
                                              color: purplePrimary,
                                              fontWeight: FontWeight.w500),
                                          "Android".toTextWeb(
                                              context: context,
                                              fontSize: 16,
                                              color: blackPrimary,
                                              fontWeight: FontWeight.w500)
                                        ],
                                      ).align(Alignment.center),
                                    ),
                                    SizedBox(
                                      width: 100.webT(context),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          "Join Date".toTextWeb(
                                              context: context,
                                              fontSize: 16,
                                              color: yellowPrimary,
                                              fontWeight: FontWeight.w500),
                                          "25 May 2023".toTextWeb(
                                              context: context,
                                              fontSize: 16,
                                              color: blackPrimary,
                                              fontWeight: FontWeight.w500)
                                        ],
                                      ).align(Alignment.centerRight),
                                    ),
                                  ],
                                )
                                    .paddingSymmetric(
                                        horizontal: 20.webT(context))
                                    .center,
                              ),
                              50.webScaleHeight(context),
                              Container(
                                height: 425.webT(context),
                                width: 420.webT(context),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(13.webT(context)),
                                    border: Border.all(
                                        color: containerBorderColor)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 57.webT(context),
                                      width: 420.webT(context),
                                      decoration: BoxDecoration(
                                          color: containerShadowColor,
                                          borderRadius: BorderRadius.circular(
                                              13.webT(context)),
                                          border: const Border(
                                              bottom: BorderSide(
                                                  color:
                                                      containerBorderColor))),
                                      child: "Weight Statistics"
                                          .toTextWeb(
                                              color: blackPrimary,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              context: context)
                                          .align(Alignment.centerLeft)
                                          .paddingSymmetric(
                                              horizontal: 20.webT(context)),
                                    ),
                                    35.webScaleHeight(context),
                                    renderingRow(
                                        context, "Starting Weight:", "85.5 kg"),
                                    renderingRow(context, "Height:", "1.36 m"),
                                    renderingRow(
                                        context, "Starting BMI:", "30.5"),
                                    renderingRow(
                                        context, "Current BMI:", "19.9"),
                                    renderingRow(
                                        context, "Latest Weight:", "65.2"),
                                    renderingRow(context, "Total Weight Lost:",
                                        "21.7 kg"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 420.webT(context),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(13.webT(context)),
                              border: Border.all(color: containerBorderColor)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 57.webT(context),
                                width: 420.webT(context),
                                decoration: BoxDecoration(
                                    color: containerShadowColor,
                                    borderRadius:
                                        BorderRadius.circular(13.webT(context)),
                                    border: const Border(
                                        bottom: BorderSide(
                                            color: containerBorderColor))),
                                child: "Account activity"
                                    .toTextWeb(
                                        color: blackPrimary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        context: context)
                                    .align(Alignment.centerLeft)
                                    .paddingSymmetric(
                                        horizontal: 20.webT(context)),
                              ),
                              35.webScaleHeight(context),
                              renderingColumn(context, "Recipe was declined.",
                                  "10-Jan-23  10:30"),
                              renderingColumn(
                                  context,
                                  "Profile picture has been updated.",
                                  "07-Mar-23  17:39"),
                              renderingColumn(
                                  context,
                                  "Account login from new device.",
                                  "Device: Xiaomi Redmi Pro 2\n31-Oct-23  23:58"),
                              renderingColumn(context, "Cancelled subscription",
                                  "05-May-22"),
                              renderingColumn(
                                  context,
                                  "Account login from new location.",
                                  "Location: New York, USA\n31-Oct-23  23:58"),
                              renderingColumn(
                                  context,
                                  "4 Recipes have been approved by Admin.",
                                  "19-Dec-22"),
                              renderingColumn(context, "Added a weight entry",
                                  "22-Jun-19  15:23"),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ).paddingAll(40.webT(context)),
              ).paddingSymmetric(horizontal: 50.webW(context)),
              40.webScaleHeight(context),
              Container(
                decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(13.webT(context)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "User Recipe Collection".toTextWeb(
                        context: context,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: blackPrimary),
                    35.webScaleHeight(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 425.webT(context),
                          width: 420.webT(context),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(13.webT(context)),
                              border: Border.all(color: containerBorderColor)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 57.webT(context),
                                width: 420.webT(context),
                                decoration: BoxDecoration(
                                    color: containerShadowColor,
                                    borderRadius:
                                        BorderRadius.circular(13.webT(context)),
                                    border: const Border(
                                        bottom: BorderSide(
                                            color: containerBorderColor))),
                                child: "Private Recipes"
                                    .toTextWeb(
                                        color: blackPrimary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        context: context)
                                    .align(Alignment.centerLeft)
                                    .paddingSymmetric(
                                        horizontal: 20.webT(context)),
                              ),
                              35.webScaleHeight(context),
                              SizedBox(
                                width: 250.webT(context),
                                child: "Chicken Salad with Mayonnaise Dressing"
                                    .toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        color: blackPrimary,
                                        fontWeight: FontWeight.w400,
                                        maxLine: 2),
                              ).center,
                              25.webScaleHeight(context),
                              SizedBox(
                                width: 250.webT(context),
                                child: "Grilled Cheese Sandwich and Tomato Soup"
                                    .toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        color: blackPrimary,
                                        fontWeight: FontWeight.w400,
                                        maxLine: 2),
                              ).center,
                              25.webScaleHeight(context),
                              SizedBox(
                                width: 250.webT(context),
                                child: "Frozen Oats Cups".toTextWeb(
                                    context: context,
                                    fontSize: 16,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w400,
                                    maxLine: 2),
                              ).center,
                              25.webScaleHeight(context),
                              SizedBox(
                                width: 250.webT(context),
                                child: "Apple and Yogurt Parfait".toTextWeb(
                                    context: context,
                                    fontSize: 16,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w400,
                                    maxLine: 2),
                              ).center,
                              25.webScaleHeight(context),
                              SizedBox(
                                width: 250.webT(context),
                                child: "Homemade Dried Fruit Bars".toTextWeb(
                                    context: context,
                                    fontSize: 16,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w400,
                                    maxLine: 2),
                              ).center,
                            ],
                          ),
                        ),
                        Container(
                          height: 425.webT(context),
                          width: 420.webT(context),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(13.webT(context)),
                              border: Border.all(color: containerBorderColor)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 57.webT(context),
                                width: 420.webT(context),
                                decoration: BoxDecoration(
                                    color: containerShadowColor,
                                    borderRadius:
                                        BorderRadius.circular(13.webT(context)),
                                    border: const Border(
                                        bottom: BorderSide(
                                            color: containerBorderColor))),
                                child: "Shared Recipes"
                                    .toTextWeb(
                                        color: blackPrimary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        context: context)
                                    .align(Alignment.centerLeft)
                                    .paddingSymmetric(
                                        horizontal: 20.webT(context)),
                              ),
                              35.webScaleHeight(context),
                              SizedBox(
                                width: 250.webT(context),
                                child: "Chicken Salad with Mayonnaise Dressing"
                                    .toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        color: blackPrimary,
                                        fontWeight: FontWeight.w400,
                                        maxLine: 2),
                              ).center,
                              25.webScaleHeight(context),
                              SizedBox(
                                width: 250.webT(context),
                                child: "Grilled Cheese Sandwich and Tomato Soup"
                                    .toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        color: blackPrimary,
                                        fontWeight: FontWeight.w400,
                                        maxLine: 2),
                              ).center,
                              25.webScaleHeight(context),
                              SizedBox(
                                width: 250.webT(context),
                                child: "Frozen Oats Cups".toTextWeb(
                                    context: context,
                                    fontSize: 16,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w400,
                                    maxLine: 2),
                              ).center,
                              25.webScaleHeight(context),
                            ],
                          ),
                        ),
                        Container(
                          height: 425.webT(context),
                          width: 420.webT(context),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(13.webT(context)),
                              border: Border.all(color: containerBorderColor)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 57.webT(context),
                                width: 420.webT(context),
                                decoration: BoxDecoration(
                                    color: containerShadowColor,
                                    borderRadius:
                                        BorderRadius.circular(13.webT(context)),
                                    border: const Border(
                                        bottom: BorderSide(
                                            color: containerBorderColor))),
                                child: "Pending Approval"
                                    .toTextWeb(
                                        color: blackPrimary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        context: context)
                                    .align(Alignment.centerLeft)
                                    .paddingSymmetric(
                                        horizontal: 20.webT(context)),
                              ),
                              35.webScaleHeight(context),
                              SizedBox(
                                width: 250.webT(context),
                                child: "Chicken Salad with Mayonnaise Dressing"
                                    .toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        color: blackPrimary,
                                        fontWeight: FontWeight.w400,
                                        maxLine: 2),
                              ).center,
                              25.webScaleHeight(context),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ).paddingAll(40.webT(context)),
              ).paddingSymmetric(horizontal: 50.webW(context)),
              40.webScaleHeight(context),
              Container(
                decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(13.webT(context)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Weight Entries".toTextWeb(
                            context: context,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: blackPrimary),
                        Container(
                          width: 160.webT(context),
                          height: 55.webT(context),
                          decoration: BoxDecoration(
                              color: bluePrimary,
                              borderRadius:
                                  BorderRadius.circular(12.webT(context))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomImage(
                                  image: Images.iconCalender,
                                  width: 24.webT(context),
                                  height: 24.webT(context)),
                              7.webWidth(context),
                              "Pick a Date"
                                  .toTextWeb(
                                      context: context,
                                      fontSize: 16,
                                      color: whitePrimary,
                                      fontWeight: FontWeight.w500)
                                  .onPress(() {
                                controller.selectDate(context);
                              })
                            ],
                          ).center,
                        ),
                      ],
                    ),
                    35.webScaleHeight(context),
                    Row(
                      children: [
                        SizedBox(
                          width: 600.webW(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Day on the Plan".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: blackPrimary),
                              CustomImage(
                                  image: Images.iconFilter,
                                  width: 16.webT(context),
                                  height: 16.webT(context))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 325.webW(context),
                          child: "Weight".toTextWeb(
                              context: context,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: blackPrimary),
                        ),
                        SizedBox(
                          width: 325.webW(context),
                          child: Row(
                            children: [
                              "Day of Entry".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: blackPrimary),
                              CustomImage(
                                  image: Images.iconFilter,
                                  width: 16.webT(context),
                                  height: 16.webT(context))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 100.webW(context),
                          child: "Action"
                              .toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: blackPrimary)
                              .align(Alignment.centerRight),
                        ),
                      ],
                    ),
                    Container(
                      height: 1.webH(context),
                      color: dividerColor,
                    ).paddingSymmetric(vertical: 20.webT(context)),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 600.webW(context),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 100.webW(context),
                                          child: Container(
                                            width: 28.webT(context),
                                            height: 28.webT(context),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.webT(context)),
                                                border: Border.all(
                                                    color: textGreyColor)),
                                          ).paddingSymmetric(
                                            horizontal: 36.webT(context),
                                          ),
                                        ),
                                        "Round 2  Day 25"
                                            .toTextWeb(
                                                context: context,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: blackPrimary)
                                            .center
                                            .expanded,
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 325.webW(context),
                                    child: "87.5 kg".toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: blackPrimary),
                                  ),
                                  SizedBox(
                                    width: 325.webW(context),
                                    child: Row(
                                      children: [
                                        "04-Aug-19  14:08".toTextWeb(
                                            context: context,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: blackPrimary),
                                        CustomImage(
                                            image: Images.iconFilter,
                                            width: 16.webT(context),
                                            height: 16.webT(context))
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.webW(context),
                                    child: CustomImage(
                                      image: Images.iconDropDown,
                                      iconColor: bluePrimary,
                                      width: 24.webT(context),
                                      height: 24.webT(context),
                                    ).align(Alignment.centerRight),
                                  ),
                                ],
                              ).onPress(() {
                                if (selectedIndex == index) {
                                  selectedIndex = -1;
                                } else {
                                  selectedIndex = index;
                                }
                                // ignore: invalid_use_of_protected_member
                                controller.notifyListeners();
                              }),
                              if (selectedIndex == index)
                                Container(
                                  decoration: BoxDecoration(
                                    color: blueSecondary.withOpacity(0.5),
                                    borderRadius:
                                        BorderRadius.circular(13.webT(context)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 425.webT(context),
                                            width: 420.webT(context),
                                            decoration: BoxDecoration(
                                                color: whitePrimary,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        13.webT(context)),
                                                border: Border.all(
                                                    color:
                                                        containerBorderColor)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 57.webT(context),
                                                  width: 420.webT(context),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          containerShadowColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13.webT(context)),
                                                      border: const Border(
                                                          bottom: BorderSide(
                                                              color:
                                                                  containerBorderColor))),
                                                  child:
                                                      "Weight and measurements"
                                                          .toTextWeb(
                                                              color:
                                                                  blackPrimary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              context: context)
                                                          .align(Alignment
                                                              .centerLeft)
                                                          .paddingSymmetric(
                                                              horizontal: 20
                                                                  .webT(
                                                                      context)),
                                                ),
                                                30.webScaleHeight(context),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              180.webT(context),
                                                          child: "Weight".toTextWeb(
                                                              context: context,
                                                              fontSize: 16,
                                                              color:
                                                                  containerTextColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              180.webT(context),
                                                          child: "13.8 kg"
                                                              .toTextWeb(
                                                                  context:
                                                                      context,
                                                                  fontSize: 16,
                                                                  color:
                                                                      blackPrimary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        )
                                                      ],
                                                    ),
                                                    5.webScaleHeight(context),
                                                    const Divider(),
                                                    5.webScaleHeight(context),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                            width: 185
                                                                .webT(context),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                    width: 90.webT(
                                                                        context),
                                                                    child: "Chest:".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 90.webT(
                                                                        context),
                                                                    child: "136 cm".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            )),
                                                        SizedBox(
                                                            width: 185
                                                                .webT(context),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                    width: 85.webT(
                                                                        context),
                                                                    child: "Neck:".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 85.webT(
                                                                        context),
                                                                    child: "67 cm".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                    10.webScaleHeight(context),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                            width: 185
                                                                .webT(context),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                    width: 90.webT(
                                                                        context),
                                                                    child: "Left Arm:".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 90.webT(
                                                                        context),
                                                                    child: "18 cm".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            )),
                                                        SizedBox(
                                                            width: 185
                                                                .webT(context),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                    width: 85.webT(
                                                                        context),
                                                                    child: "Right Arm:".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 85.webT(
                                                                        context),
                                                                    child: "18 cm".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                    10.webScaleHeight(context),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                            width: 185
                                                                .webT(context),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                    width: 90.webT(
                                                                        context),
                                                                    child: "Waist:".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 90.webT(
                                                                        context),
                                                                    child: "56 cm".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            )),
                                                        SizedBox(
                                                            width: 185
                                                                .webT(context),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                    width: 85.webT(
                                                                        context),
                                                                    child: "Hips:".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 85.webT(
                                                                        context),
                                                                    child: "65 cm".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                    10.webScaleHeight(context),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                            width: 185
                                                                .webT(context),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                    width: 90.webT(
                                                                        context),
                                                                    child: "Left Thigh:".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 90.webT(
                                                                        context),
                                                                    child: "37 cm".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            )),
                                                        SizedBox(
                                                            width: 185
                                                                .webT(context),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                    width: 85.webT(
                                                                        context),
                                                                    child: "Right Thigh:".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 85.webT(
                                                                        context),
                                                                    child: "38 cm".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                    10.webScaleHeight(context),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                            width: 185
                                                                .webT(context),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                    width: 90.webT(
                                                                        context),
                                                                    child: "Left Calf:".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 90.webT(
                                                                        context),
                                                                    child: "16 cm".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            )),
                                                        SizedBox(
                                                            width: 185
                                                                .webT(context),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                    width: 85.webT(
                                                                        context),
                                                                    child: "Right Calf:".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            containerTextColor,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        maxLine:
                                                                            2)),
                                                                SizedBox(
                                                                    width: 85.webT(
                                                                        context),
                                                                    child: "18 cm".toTextWeb(
                                                                        context:
                                                                            context,
                                                                        fontSize:
                                                                            16,
                                                                        color:
                                                                            blackPrimary,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        maxLine:
                                                                            2)),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                    5.webScaleHeight(context),
                                                    const Divider(),
                                                    5.webScaleHeight(context),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              180.webT(context),
                                                          child: "Blood Pressure:"
                                                              .toTextWeb(
                                                                  context:
                                                                      context,
                                                                  fontSize: 16,
                                                                  color:
                                                                      containerTextColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              180.webT(context),
                                                          child: "120/80 mmHg"
                                                              .toTextWeb(
                                                                  context:
                                                                      context,
                                                                  fontSize: 16,
                                                                  color:
                                                                      blackPrimary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        )
                                                      ],
                                                    ),
                                                    10.webScaleHeight(context),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              180.webT(context),
                                                          child: "Blood Sugar"
                                                              .toTextWeb(
                                                                  context:
                                                                      context,
                                                                  fontSize: 16,
                                                                  color:
                                                                      containerTextColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              180.webT(context),
                                                          child: "5.6 mmol/L"
                                                              .toTextWeb(
                                                                  context:
                                                                      context,
                                                                  fontSize: 16,
                                                                  color:
                                                                      blackPrimary,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ).paddingSymmetric(
                                                    horizontal:
                                                        20.webT(context))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 425.webT(context),
                                            width: 420.webT(context),
                                            decoration: BoxDecoration(
                                                color: whitePrimary,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        13.webT(context)),
                                                border: Border.all(
                                                    color:
                                                        containerBorderColor)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 57.webT(context),
                                                  width: 420.webT(context),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          containerShadowColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13.webT(context)),
                                                      border: const Border(
                                                          bottom: BorderSide(
                                                              color:
                                                                  containerBorderColor))),
                                                  child: "Images"
                                                      .toTextWeb(
                                                          color: blackPrimary,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          context: context)
                                                      .align(
                                                          Alignment.centerLeft)
                                                      .paddingSymmetric(
                                                          horizontal:
                                                              20.webT(context)),
                                                ),
                                                30.webScaleHeight(context),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              180.webT(context),
                                                          child: "Body".toTextWeb(
                                                              context: context,
                                                              fontSize: 16,
                                                              color:
                                                                  containerTextColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              180.webT(context),
                                                          child: "Face".toTextWeb(
                                                              context: context,
                                                              fontSize: 16,
                                                              color:
                                                                  blackPrimary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ).paddingSymmetric(
                                                    horizontal:
                                                        20.webT(context))
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 425.webT(context),
                                            width: 420.webT(context),
                                            decoration: BoxDecoration(
                                                color: whitePrimary,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        13.webT(context)),
                                                border: Border.all(
                                                    color:
                                                        containerBorderColor)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 57.webT(context),
                                                  width: 420.webT(context),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          containerShadowColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13.webT(context)),
                                                      border: const Border(
                                                          bottom: BorderSide(
                                                              color:
                                                                  containerBorderColor))),
                                                  child: "Journal Entry"
                                                      .toTextWeb(
                                                          color: blackPrimary,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          context: context)
                                                      .align(
                                                          Alignment.centerLeft)
                                                      .paddingSymmetric(
                                                          horizontal:
                                                              20.webT(context)),
                                                ),
                                                25.webScaleHeight(context),
                                                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
                                                    .toTextWeb(
                                                        context: context,
                                                        fontSize: 16,
                                                        color: blackPrimary,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        maxLine: 10000)
                                                    .paddingSymmetric(
                                                      horizontal:
                                                          20.webT(context),
                                                    ),
                                                20.webScaleHeight(context),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ).paddingAll(40.webT(context)),
                                ).paddingSymmetric(
                                    vertical: 30.webW(context),
                                    horizontal: 20.webT(context)),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 1.webH(context),
                            color: dividerColor,
                          ).paddingSymmetric(vertical: 20.webT(context));
                        },
                        itemCount: 5),
                  ],
                ).paddingAll(40.webT(context)),
              ).paddingSymmetric(horizontal: 50.webW(context)),
              40.webScaleHeight(context),
              Container(
                decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(13.webT(context)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "App Spend".toTextWeb(
                        context: context,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: blackPrimary),
                    35.webScaleHeight(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 450.webW(context),
                          child: "Date"
                              .toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: containerTextColor)
                              .align(Alignment.centerLeft),
                        ),
                        SizedBox(
                          width: 450.webW(context),
                          child: "Amount"
                              .toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: containerTextColor)
                              .center,
                        ),
                        SizedBox(
                          width: 450.webW(context),
                          child: "Item"
                              .toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: containerTextColor)
                              .center,
                        ),
                      ],
                    ),
                    Container(
                      height: 1.webH(context),
                      color: dividerColor,
                    ).paddingSymmetric(vertical: 20.webT(context)),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 450.webW(context),
                                child: "13-Jan-2023  21:17"
                                    .toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: blackPrimary)
                                    .align(Alignment.centerLeft),
                              ),
                              SizedBox(
                                width: 450.webW(context),
                                child: "R86.09"
                                    .toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: blackPrimary)
                                    .center,
                              ),
                              SizedBox(
                                width: 450.webW(context),
                                child: Container(
                                        width: 135.webT(context),
                                        height: 32.webT(context),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                32.webT(context)),
                                            border: Border.all(
                                                color: greenPrimary)),
                                        child: "App Purchase"
                                            .toTextWeb(
                                                context: context,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: greenPrimary)
                                            .center)
                                    .paddingSymmetric(
                                        horizontal: 145.webW(context)),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 1.webH(context),
                            color: dividerColor,
                          ).paddingSymmetric(vertical: 20.webT(context));
                        },
                        itemCount: 5),
                    Container(
                      height: 1.webH(context),
                      color: dividerColor,
                    ).paddingSymmetric(vertical: 20.webT(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        "Lifetime Spend".toTextWeb(
                            context: context,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        50.webScaleWidth(context),
                        WebCustomButton(
                          buttonName: "R1 592.99",
                          onPressed: () {},
                          buttonTextColor: whitePrimary,
                          borderColor: bluePrimary,
                          buttonColor: bluePrimary,
                          width: 160.webW(context),
                          height: 55.webH(context),
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(40.webT(context)),
              ).paddingSymmetric(horizontal: 50.webW(context)),
              20.webScaleHeight(context),
            ],
          ),
        ),
      );
    });
  }

  renderingDetailBox(
      BuildContext context,
      String title,
      String titleNumber,
      String titleIcon,
      String arrowIcon,
      String titlePercentage,
      String titleDescription) {
    return SizedBox(
      width: 280.webW(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleNumber.toTextWeb(
                  context: context,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: blackPrimary),
              Container(
                width: 60.webT(context),
                height: 60.webT(context),
                decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(16.webT(context)),
                  boxShadow: [
                    BoxShadow(
                      color: blueSecondary.withOpacity(0.2),
                      offset: const Offset(0, 3),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: CustomImage(
                  image: titleIcon,
                  width: 25.webT(context),
                  height: 25.webT(context),
                ).center,
              ),
            ],
          ),
          title.toTextWeb(context: context, fontSize: 22, color: blackPrimary),
          15.webHeight(context),
          Row(
            children: [
              CustomImage(
                image: arrowIcon,
                width: 25.webT(context),
                height: 25.webT(context),
              ),
              10.webWidth(context),
              titlePercentage.toTextWeb(context: context, fontSize: 18),
              15.webWidth(context),
              titleDescription.toTextWeb(context: context, fontSize: 18),
            ],
          )
        ],
      ),
    );
  }

  renderingRow(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 180.webT(context),
          child: title.toTextWeb(
              context: context,
              fontSize: 16,
              color: containerTextColor,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 180.webT(context),
          child: value.toTextWeb(
              context: context,
              fontSize: 16,
              color: blackPrimary,
              fontWeight: FontWeight.w500),
        )
      ],
    ).paddingOnly(
        left: 20.webT(context),
        right: 20.webT(context),
        bottom: 27.webT(context));
  }

  renderingColumn(BuildContext context, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 365.webT(context),
          child: title.toTextWeb(
              context: context,
              fontSize: 16,
              color: blackPrimary,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 365.webT(context),
          child: value.toTextWeb(
              context: context,
              fontSize: 16,
              color: containerTextColor,
              fontWeight: FontWeight.w500,
              maxLine: 2),
        )
      ],
    ).paddingOnly(
        left: 20.webT(context),
        right: 20.webT(context),
        bottom: 32.webT(context));
  }
}
