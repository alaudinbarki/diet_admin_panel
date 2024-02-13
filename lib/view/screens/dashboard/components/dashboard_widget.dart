import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/screens/dashboard/components/custom_popup_menu.dart';
import 'package:base_code/view/screens/dashboard/components/line_chart.dart';
import 'package:base_code/view/screens/dashboard/components/radial_chart_dashboard.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1294.webH(context),
      color: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 120.webT(context),
              decoration: BoxDecoration(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "The 28 Day Diet App".toTextWeb(
                          context: context,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: blackPrimary),
                      "ADMIN PANEL".toTextWeb(
                        context: context,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImage(
                          image: Images.iconProfileImage,
                          width: 50.webT(context),
                          height: 50.webT(context)),
                      10.webWidth(context),
                      "Marci Fumons".toTextWeb(
                          context: context, fontSize: 22, color: blackPrimary),
                      CustomPopupMenuButton()
                    ],
                  )
                ],
              ).paddingSymmetric(horizontal: 50.webW(context)),
            ),
            18.webHeight(context),
            Container(
              height: 185.webT(context),
              decoration: BoxDecoration(
                  color: whitePrimary,
                  border:
                      Border.all(color: borderColor, width: 1.webT(context)),
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
                  Container(color: dividerColor, width: 2.webW(context)),
                  renderingDetailBox(
                      context,
                      "Active subscriptions",
                      "4 320",
                      Images.iconActiveUser,
                      Images.iconArrowUp,
                      "7.2",
                      "+1.51% this week"),
                ],
              ).paddingAll(18.webT(context)),
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
                          "Active Installs".toTextWeb(
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
                                    color: iosLineColor),
                              ),
                              12.webScaleWidth(context),
                              "iOS install".toTextWeb(
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
                                    color: androidLineColor),
                              ),
                              12.webScaleWidth(context),
                              "Android Install".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: blackPrimary),
                              15.webScaleWidth(context),
                              Container(
                                decoration: BoxDecoration(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    "Monthly".toTextWeb(
                                      context: context,
                                      fontSize: 16,
                                      color: blackPrimary,
                                    ),
                                    5.webWidth(context),
                                    CustomImage(
                                        image: Images.iconDropDown,
                                        width: 22.webT(context),
                                        height: 22.webT(context)),
                                  ],
                                )
                                    .paddingSymmetric(
                                        horizontal: 12.webW(context),
                                        vertical: 5.webH(context))
                                    .center,
                              ),
                            ],
                          ),
                        ],
                      ),
                      LineChartWidget(),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Earnings".toTextWeb(
                              context: context,
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: blackPrimary),
                          CustomImage(
                              image: Images.iconThisMonth,
                              width: 22.webT(context),
                              height: 22.webT(context)),
                        ],
                      ),
                      22.webScaleHeight(context),
                      RadialChartDashboard().center,
                      22.webScaleHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 12.webT(context),
                                height: 12.webT(context),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: yellowPrimary,
                                ),
                              ),
                              12.webScaleWidth(context),
                              "Subscriptions ".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: blackPrimary),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 12.webT(context),
                                height: 12.webT(context),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: greenPrimary),
                              ),
                              12.webScaleWidth(context),
                              "App Purchases ".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: blackPrimary),
                            ],
                          ),
                        ],
                      ),
                      25.webHeight(context),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 12.webT(context),
                            height: 12.webT(context),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: redPrimary),
                          ),
                          12.webScaleWidth(context),
                          "Refunds".toTextWeb(
                              context: context,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: blackPrimary),
                        ],
                      ),
                    ],
                  ).paddingAll(25.webT(context)),
                ),
              ],
            ).paddingSymmetric(horizontal: 48.webW(context)),
            20.webHeight(context),
            Container(
              decoration: BoxDecoration(
                  color: whitePrimary,
                  border:
                      Border.all(color: borderColor, width: 1.webT(context)),
                  borderRadius: BorderRadius.circular(16.webT(context))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Order List".toTextWeb(
                          context: context,
                          fontSize: 26,
                          color: blackPrimary,
                          fontWeight: FontWeight.w500),
                      Container(
                        decoration: BoxDecoration(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            "Monthly".toTextWeb(
                              context: context,
                              fontSize: 16,
                              color: blackPrimary,
                            ),
                            5.webWidth(context),
                            CustomImage(
                                image: Images.iconDropDown,
                                width: 22.webT(context),
                                height: 22.webT(context)),
                          ],
                        )
                            .paddingSymmetric(
                                horizontal: 12.webW(context),
                                vertical: 5.webH(context))
                            .center,
                      ),
                    ],
                  ),
                  25.webHeight(context),
                  Row(
                    children: [
                      SizedBox(
                        width: 208.webW(context),
                        child: "Email".toTextWeb(
                            context: context,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: blackPrimary),
                      ),
                      SizedBox(
                        width: 208.webW(context),
                        child: Row(
                          children: [
                            "Date".toTextWeb(
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
                        width: 208.webW(context),
                        child: Row(
                          children: [
                            "Location".toTextWeb(
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
                        width: 208.webW(context),
                        child: "Order Details".toTextWeb(
                            context: context,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: blackPrimary),
                      ),
                      SizedBox(
                        width: 208.webW(context),
                        child: "Amount".toTextWeb(
                            context: context,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: blackPrimary),
                      ),
                      SizedBox(
                        width: 208.webW(context),
                        child: Row(
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
                        ),
                      ),
                      SizedBox(
                        width: 208.webW(context),
                        child: "Platform".toTextWeb(
                            context: context,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: blackPrimary),
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
                          children: [
                            SizedBox(
                              width: 208.webW(context),
                              child: "heleenvdm@gmail.com".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: blackPrimary),
                            ),
                            SizedBox(
                              width: 208.webW(context),
                              child: "21 Nov 2021".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: blackPrimary),
                            ),
                            SizedBox(
                              width: 208.webW(context),
                              child: "Cape Town, ZA".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: blackPrimary),
                            ),
                            SizedBox(
                              width: 208.webW(context),
                              child: "App Purchase".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: blackPrimary),
                            ),
                            SizedBox(
                              width: 208.webW(context),
                              child: "ZAR 39.00".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: blackPrimary),
                            ),
                            SizedBox(
                              width: 208.webW(context),
                              child: Container(
                                width: 125.webW(context),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(10.webT(context)),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: index % 2 == 0
                                            ? redPrimary
                                            : greenPrimary,
                                        radius: 5.webT(context)),
                                    10.webWidth(context),
                                    "Charged".toTextWeb(
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
                                  .align(Alignment.centerLeft)
                                  .paddingOnly(right: 30.webW(context)),
                            ),
                            SizedBox(
                              width: 208.webW(context),
                              child: "Android".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: blackPrimary),
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
                      itemCount: 10)
                ],
              ).paddingAll(18.webT(context)),
            ).paddingSymmetric(horizontal: 48.webW(context)),
            20.webHeight(context),
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
