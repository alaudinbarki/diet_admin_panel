import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
// import 'package:base_code/view/screens/dashboard/components/custom_popup_menu.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../helper/routes_helper.dart';
import '../../../../../widgets/web_header.dart';
import 'line_chart_widget_tracker.dart';

class WidgetTrackerWidget extends StatelessWidget {
  const WidgetTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Container(
      height: 1294.webH(context),
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const WebHeader(),
            // Container(
            //   height: 120.webT(context),
            //   decoration: BoxDecoration(
            //     color: whitePrimary,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.shade100,
            //         offset: const Offset(0, 3),
            //         blurRadius: 1,
            //         spreadRadius: 1,
            //       ),
            //     ],
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           CustomImage(image: Images.iconProfileImage, width: 50.webT(context), height: 50.webT(context)),
            //           10.webWidth(context),
            //           "Marci Fumons".toTextWeb(context: context, fontSize: 22, color: blackPrimary),
            //           CustomPopupMenuButton()
            //         ],
            //       )
            //     ],
            //   ).paddingSymmetric(horizontal: 50.webW(context)),
            // ),
            18.webHeight(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 185.webT(context),
                  width: 1120.webT(context),
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      border: Border.all(
                          color: borderColor, width: 1.webT(context)),
                      borderRadius: BorderRadius.circular(16.webT(context))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      renderingDetailBox(
                          context,
                          "Active User",
                          "400",
                          Images.iconActiveUser,
                          Images.iconArrowUp,
                          "10.2",
                          "+1.01% this week"),
                      Container(color: dividerColor, width: (2).webW(context)),
                      renderingDetailBox(
                          context,
                          "Earnings this month",
                          "R7 856.25",
                          Images.iconThisMonth,
                          Images.iconArrowUp,
                          "3.1",
                          "+0.49% this week"),
                      Container(color: dividerColor, width: 2.webW(context)),
                      renderingDetailBox(
                          context,
                          "Total User",
                          "46 827",
                          Images.iconTotalUser,
                          Images.iconArrowDown,
                          "2.56",
                          "-0.91% this week"),
                    ],
                  ).paddingAll(18.webT(context)),
                ),
                Container(
                  width: 355.webT(context),
                  height: 185.webT(context),
                  decoration: BoxDecoration(
                      color: blueSecondary.withOpacity(0.5),
                      border: Border.all(
                          color: blueSecondary, width: 1.webT(context)),
                      borderRadius: BorderRadius.circular(16.webT(context))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Date range".toTextWeb(
                          context: context,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: blackPrimary),
                      "21 Nov 2022 - 29 Nov 2022".toTextWeb(
                          context: context,
                          fontSize: 22,
                          color: containerTextColor),
                      20.webScaleHeight(context),
                      WebCustomButton(
                        buttonName: "Pick a Date",
                        onPressed: () {
                          authProvider.selectDate(context);
                        },
                        buttonColor: bluePrimary,
                        buttonTextColor: whitePrimary,
                        borderColor: bluePrimary,
                        width: 320.webT(context),
                        height: 55.webT(context),
                      ),
                    ],
                  ).paddingAll(15.webT(context)),
                ),
              ],
            ).paddingSymmetric(horizontal: 48.webW(context)),
            20.webHeight(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 1120.webT(context),
                  height: 460.webT(context),
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      border: Border.all(
                          color: borderColor, width: 1.webT(context)),
                      borderRadius: BorderRadius.circular(16.webT(context))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Total Weight Loss".toTextWeb(
                              context: context,
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: blackPrimary),
                          Row(
                            children: [
                              Container(
                                width: 12.webT(context),
                                height: 12.webT(context),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: allUserLineColor),
                              ),
                              12.webScaleWidth(context),
                              "All User".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: blackPrimary),
                              15.webScaleWidth(context),
                              Container(
                                width: 12.webT(context),
                                height: 12.webT(context),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: menLineColor),
                              ),
                              12.webScaleWidth(context),
                              "Men".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: blackPrimary),
                              15.webScaleWidth(context),
                              Container(
                                width: 12.webT(context),
                                height: 12.webT(context),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: womenLineColor),
                              ),
                              12.webScaleWidth(context),
                              "Women".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: blackPrimary),
                            ],
                          ),
                        ],
                      ),
                      LineChartWidgetTracker(),
                    ],
                  ).paddingOnly(
                      left: 25.webT(context),
                      right: 25.webT(context),
                      top: 25.webT(context),
                      bottom: 10.webT(context)),
                ),
                Container(
                  width: 355.webT(context),
                  height: 460.webT(context),
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      border: Border.all(
                          color: borderColor, width: 1.webT(context)),
                      borderRadius: BorderRadius.circular(16.webT(context))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Chart criteria".toTextWeb(
                          context: context,
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: blackPrimary),
                      12.webHeight(context),
                      "Gender".toTextWeb(
                          context: context,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: blackPrimary),
                      10.webHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 80.webT(context),
                            height: 32.webT(context),
                            decoration: BoxDecoration(
                                color: whitePrimary,
                                border: Border.all(
                                    color: greenPrimary,
                                    width: 1.webT(context)),
                                borderRadius:
                                    BorderRadius.circular(5.webT(context))),
                            child: "All User"
                                .toTextWeb(
                                    context: context,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: blackPrimary)
                                .center,
                          ),
                          12.webWidth(context),
                          Container(
                            width: 80.webT(context),
                            height: 32.webT(context),
                            decoration: BoxDecoration(
                                color: whitePrimary,
                                border: Border.all(
                                    color: bluePrimary, width: 1.webT(context)),
                                borderRadius:
                                    BorderRadius.circular(5.webT(context))),
                            child: "Men"
                                .toTextWeb(
                                    context: context,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: blackPrimary)
                                .center,
                          ),
                          12.webWidth(context),
                          Container(
                            width: 80.webT(context),
                            height: 32.webT(context),
                            decoration: BoxDecoration(
                                color: whitePrimary,
                                border: Border.all(
                                    color: pinkPrimary, width: 1.webT(context)),
                                borderRadius:
                                    BorderRadius.circular(5.webT(context))),
                            child: "Women"
                                .toTextWeb(
                                    context: context,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: blackPrimary)
                                .center,
                          ),
                        ],
                      ),
                      12.webHeight(context),
                      "Gender".toTextWeb(
                          context: context,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: blackPrimary),
                      10.webHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < 7; i++)
                            Row(
                              children: [
                                Container(
                                  width: 32.webT(context),
                                  height: 32.webT(context),
                                  decoration: BoxDecoration(
                                      color: whitePrimary,
                                      border: Border.all(
                                          color: greyPrimary,
                                          width: 1.webT(context)),
                                      borderRadius: BorderRadius.circular(
                                          32.webT(context))),
                                  child: (i + 1)
                                      .toString()
                                      .toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: blackPrimary)
                                      .center,
                                ).paddingOnly(right: 7.webW(context)),
                              ],
                            ),
                        ],
                      ),
                      10.webHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 7; i < 14; i++)
                            Row(
                              children: [
                                Container(
                                  width: 32.webT(context),
                                  height: 32.webT(context),
                                  decoration: BoxDecoration(
                                      color: whitePrimary,
                                      border: Border.all(
                                          color: greyPrimary,
                                          width: 1.webT(context)),
                                      borderRadius: BorderRadius.circular(
                                          32.webT(context))),
                                  child: (i + 1)
                                      .toString()
                                      .toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: blackPrimary)
                                      .center,
                                ).paddingOnly(right: 7.webW(context)),
                              ],
                            ),
                        ],
                      ),
                      10.webHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 14; i < 21; i++)
                            Row(
                              children: [
                                Container(
                                  width: 32.webT(context),
                                  height: 32.webT(context),
                                  decoration: BoxDecoration(
                                      color: whitePrimary,
                                      border: Border.all(
                                          color: greyPrimary,
                                          width: 1.webT(context)),
                                      borderRadius: BorderRadius.circular(
                                          32.webT(context))),
                                  child: (i + 1)
                                      .toString()
                                      .toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: blackPrimary)
                                      .center,
                                ).paddingOnly(right: 7.webW(context)),
                              ],
                            ),
                        ],
                      ),
                      10.webHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 21; i < 28; i++)
                            Row(
                              children: [
                                Container(
                                  width: 32.webT(context),
                                  height: 32.webT(context),
                                  decoration: BoxDecoration(
                                      color: whitePrimary,
                                      border: Border.all(
                                          color: greyPrimary,
                                          width: 1.webT(context)),
                                      borderRadius: BorderRadius.circular(
                                          32.webT(context))),
                                  child: (i + 1)
                                      .toString()
                                      .toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: blackPrimary)
                                      .center,
                                ).paddingOnly(right: 7.webW(context)),
                              ],
                            ),
                        ],
                      ),
                      12.webHeight(context),
                      "Round".toTextWeb(
                          context: context,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: blackPrimary),
                      10.webHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0; i < 6; i++)
                            Row(
                              children: [
                                Container(
                                  width: 32.webT(context),
                                  height: 32.webT(context),
                                  decoration: BoxDecoration(
                                      color: whitePrimary,
                                      border: Border.all(
                                          color: iosLineColor,
                                          width: 1.webT(context)),
                                      borderRadius: BorderRadius.circular(
                                          6.webT(context))),
                                  child: (i + 1)
                                      .toString()
                                      .toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: blackPrimary)
                                      .center,
                                ).paddingOnly(right: 7.webW(context)),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ).paddingOnly(
                      left: 25.webT(context),
                      right: 25.webT(context),
                      top: 25.webT(context),
                      bottom: 10.webT(context)),
                ),
              ],
            ).paddingSymmetric(horizontal: 48.webW(context)),
            20.webHeight(context),
            Container(
              // height: 1200.webT(context),
              decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(13.webT(context))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Latest User Entries"
                          .toTextWeb(
                              context: context,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: blackPrimary)
                          .paddingSymmetric(vertical: 20.webT(context)),
                      Container(
                        width: 100.webT(context),
                        height: 35.webT(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.webT(context)),
                          color: bluePrimary,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade100,
                              offset: const Offset(0, 3),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            "Export".toTextWeb(
                              context: context,
                              fontSize: 16,
                              color: whitePrimary,
                            ),
                            5.webWidth(context),
                            CustomImage(
                              image: Images.iconDropDown,
                              width: 22.webT(context),
                              height: 22.webT(context),
                              iconColor: whitePrimary,
                            ),
                          ],
                        ).center,
                      ),
                    ],
                  ),
                  25.webHeight(context),
                  Row(
                    children: [
                      SizedBox(
                        width: 100.webW(context),
                        child: SizedBox(
                          width: 100.webW(context),
                          child: Container(
                            width: 28.webT(context),
                            height: 28.webT(context),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(5.webT(context)),
                                border: Border.all(color: textGreyColor)),
                          ).paddingSymmetric(
                            horizontal: 36.webT(context),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 270.webW(context),
                        child: Row(
                          children: [
                            "Name and surname".toTextWeb(
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: blackPrimary),
                            CustomImage(
                                image: Images.iconFilter,
                                width: 16.webT(context),
                                height: 16.webT(context))
                          ],
                        ).center,
                      ),
                      SizedBox(
                        width: 265.webW(context),
                        child: "Day on the Plan"
                            .toTextWeb(
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: blackPrimary)
                            .center,
                      ),
                      SizedBox(
                        width: 265.webW(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Date of Entry".toTextWeb(
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: blackPrimary),
                            CustomImage(
                                image: Images.iconFilter,
                                width: 16.webT(context),
                                height: 16.webT(context))
                          ],
                        ).center,
                      ),
                      SizedBox(
                          width: 265.webW(context),
                          child: "Weight Change"
                              .toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: blackPrimary)
                              .center),
                      SizedBox(
                        width: 265.webW(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Status".toTextWeb(
                                context: context,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: blackPrimary),
                            CustomImage(
                                image: Images.iconFilter,
                                width: 16.webT(context),
                                height: 16.webT(context))
                          ],
                        ).center,
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
                                  width: 100.webW(context),
                                  child: Container(
                                    width: 28.webT(context),
                                    height: 28.webT(context),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            5.webT(context)),
                                        border:
                                            Border.all(color: textGreyColor)),
                                  ).paddingSymmetric(
                                    horizontal: 36.webT(context),
                                  ),
                                ),
                                SizedBox(
                                  width: 270.webW(context),
                                  child: Row(
                                    children: [
                                      CustomImage(
                                          image: Images.iconDummyImage,
                                          width: 40.webT(context),
                                          height: 40.webT(context)),
                                      16.webWidth(context),
                                      "Poppie van Staden".toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: blackPrimary),
                                    ],
                                  ).center,
                                ),
                                SizedBox(
                                  width: 265.webW(context),
                                  child: "Day 1"
                                      .toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: blackPrimary)
                                      .center,
                                ),
                                SizedBox(
                                  width: 265.webW(context),
                                  child: "18-Feb-19  05:49"
                                      .toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: blackPrimary)
                                      .center,
                                ),
                                SizedBox(
                                  width: 265.webW(context),
                                  child: "+1.2 kg"
                                      .toTextWeb(
                                          context: context,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: blackPrimary)
                                      .center,
                                ),
                                SizedBox(
                                  width: 265.webW(context),
                                  child: Container(
                                    width: 125.webW(context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          10.webT(context)),
                                      color: whitePrimary,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade100,
                                          offset: const Offset(0, 3),
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            backgroundColor: index % 2 == 0
                                                ? redPrimary
                                                : greenPrimary,
                                            radius: 5.webT(context)),
                                        10.webWidth(context),
                                        index % 2 == 0
                                            ? "Basic".toTextWeb(
                                                context: context,
                                                fontSize: 16,
                                                color: blackPrimary,
                                              )
                                            : "Active".toTextWeb(
                                                context: context,
                                                fontSize: 16,
                                                color: blackPrimary,
                                              ),
                                      ],
                                    )
                                        .paddingSymmetric(
                                            horizontal: 12.webW(context),
                                            vertical: 5.webH(context))
                                        .center,
                                  )
                                      .align(Alignment.center)
                                      .paddingOnly(right: 30.webW(context)),
                                ),
                              ],
                            ).onPress(() {
                              Navigator.pushNamed(
                                  context, RouterHelper.userDetailScreen);
                            }),
                            if (index == 14)
                              Container(
                                height: 75.webT(context),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(13.webT(context)),
                                  color: greyButtonColor,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        "1 ".toTextWeb(
                                            context: context,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: bluePrimary),
                                        "- 20 of 1 256".toTextWeb(
                                            context: context,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: textGreyColor),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        "Entries per page".toTextWeb(
                                            context: context,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: textGreyColor),
                                        15.webWidth(context),
                                        Container(
                                          width: 80.webT(context),
                                          height: 40.webT(context),
                                          decoration: BoxDecoration(
                                            color: whitePrimary,
                                            border: Border.all(
                                                color: greyButtonColor),
                                            borderRadius: BorderRadius.circular(
                                                16.webT(context)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: blueSecondary
                                                    .withOpacity(0.2),
                                                offset: const Offset(0, 3),
                                                blurRadius: 1,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              "25".toTextWeb(
                                                  context: context,
                                                  fontSize: 16,
                                                  color: bluePrimary),
                                              6.webWidth(context),
                                              CustomImage(
                                                image: Images.iconDropDown,
                                                width: 24.webT(context),
                                                height: 24.webT(context),
                                                iconColor: bluePrimary,
                                              ),
                                            ],
                                          ).center,
                                        ),
                                        Container(
                                          height: 33.webT(context),
                                          width: 1.webT(context),
                                          color: greyLight,
                                        ).paddingSymmetric(
                                            horizontal: 15.webT(context)),
                                        Container(
                                          width: 40.webT(context),
                                          height: 40.webT(context),
                                          decoration: BoxDecoration(
                                            color: whitePrimary,
                                            border: Border.all(
                                                color: greyButtonColor),
                                            borderRadius: BorderRadius.circular(
                                                16.webT(context)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: blueSecondary
                                                    .withOpacity(0.2),
                                                offset: const Offset(0, 3),
                                                blurRadius: 1,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: greyLight,
                                            size: 24.webT(context),
                                          ).center,
                                        ),
                                        "of 29"
                                            .toTextWeb(
                                                context: context,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: bluePrimary)
                                            .paddingSymmetric(
                                                horizontal: 15.webT(context)),
                                        Container(
                                          width: 40.webT(context),
                                          height: 40.webT(context),
                                          decoration: BoxDecoration(
                                            color: whitePrimary,
                                            border: Border.all(
                                                color: greyButtonColor),
                                            borderRadius: BorderRadius.circular(
                                                16.webT(context)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: blueSecondary
                                                    .withOpacity(0.2),
                                                offset: const Offset(0, 3),
                                                blurRadius: 1,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: bluePrimary,
                                            size: 24.webT(context),
                                          ).center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ).center.paddingSymmetric(
                                    horizontal: 40.webT(context)),
                              ).paddingSymmetric(vertical: 20.webT(context)),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 1.webH(context),
                          color: dividerColor,
                        ).paddingSymmetric(vertical: 20.webT(context));
                      },
                      itemCount: 15)
                ],
              ).center.paddingSymmetric(horizontal: 40.webT(context)),
            ).paddingSymmetric(horizontal: 50.webT(context)),
          ],
        ),
      ),
    );
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
}
