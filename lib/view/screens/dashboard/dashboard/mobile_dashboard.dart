import 'package:base_code/view/screens/dashboard/components/custom_drawer.dart';
import 'package:base_code/view/screens/dashboard/components/line_chart.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../provider/authentication_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../widgets/custom_image.dart';
import '../components/custom_popup_menu.dart';
import '../components/radial_chart_dashboard.dart';

class MobileDashboardScreen extends StatefulWidget {
  const MobileDashboardScreen({Key? key}) : super(key: key);

  @override
  State<MobileDashboardScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<MobileDashboardScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: SafeArea(
        // bottom: Platform.isAndroid ? true : false,
        // top: Platform.isAndroid ? true : false,
        child: Scaffold(
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
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "The 28 Day Diet App".toText(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: blackPrimary),
                "ADMIN PANEL".toText(
                  fontSize: 10,
                ),
              ],
            ),
            actions: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImage(
                      image: Images.iconProfileImage,
                      width: 16.w,
                      height: 16.w),
                  4.width,
                  "Marci Fumons".toText(fontSize: 12, color: blackPrimary),
                  CustomPopupMenuButton(
                    fromMobile: true,
                  )
                ],
              )
            ],
          ),
          body: Consumer<AuthProvider>(builder: (context, controller, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  30.height,
                  Container(
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
                            Container(
                                color: dividerColor, width: (2).webW(context)),
                            renderingDetailBox(
                                context,
                                "Earnings this month",
                                "R7 856.25",
                                Images.iconThisMonth,
                                Images.iconArrowUp,
                                "3.1",
                                "+0.49% this week"),
                          ],
                        ).paddingAll(18.webT(context)),
                        5.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            renderingDetailBox(
                                context,
                                "Total User",
                                "46 827",
                                Images.iconTotalUser,
                                Images.iconArrowDown,
                                "2.56",
                                "-0.91% this week"),
                            Container(
                                color: dividerColor, width: 2.webW(context)),
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
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 48.webW(context)),
                  20.webHeight(context),
                  Container(
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        border: Border.all(
                            color: borderColor, width: 1.webT(context)),
                        borderRadius: BorderRadius.circular(5.w)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Active Installs".toText(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: blackPrimary),
                            Row(
                              children: [
                                Container(
                                  width: 4.w,
                                  height: 4.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: iosLineColor),
                                ),
                                4.width,
                                "iOS install".toText(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: blackPrimary),
                                4.width,
                                Container(
                                  width: 4.w,
                                  height: 4.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: androidLineColor),
                                ),
                                4.width,
                                "Android Install".toText(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: blackPrimary),
                                4.width,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      "Monthly".toText(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: blackPrimary),
                                      1.width,
                                      CustomImage(
                                          image: Images.iconDropDown,
                                          width: 12.w,
                                          height: 12.w),
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
                        LineChartWidget(
                          fromMobile: true,
                        ),
                      ],
                    ).paddingOnly(
                        left: 25.webT(context),
                        right: 25.webT(context),
                        top: 25.webT(context),
                        bottom: 10.webT(context)),
                  ).paddingSymmetric(horizontal: 48.webW(context)),
                  20.webHeight(context),
                  Container(
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        border: Border.all(
                            color: borderColor, width: 1.webT(context)),
                        borderRadius: BorderRadius.circular(4.w)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Earnings".toText(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: blackPrimary),
                            CustomImage(
                                image: Images.iconThisMonth,
                                width: 14.w,
                                height: 14.w),
                          ],
                        ),
                        22.webScaleHeight(context),
                        RadialChartDashboard(
                          fromMobile: true,
                        ).center,
                        22.webScaleHeight(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 4.w,
                                  height: 4.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: yellowPrimary,
                                  ),
                                ),
                                12.webScaleWidth(context),
                                "Subscriptions ".toText(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: blackPrimary),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 4.w,
                                  height: 4.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: greenPrimary),
                                ),
                                12.webScaleWidth(context),
                                "App Purchases ".toText(
                                    fontSize: 12,
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
                              width: 4.w,
                              height: 4.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: redPrimary),
                            ),
                            12.webScaleWidth(context),
                            "Refunds".toText(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: blackPrimary),
                          ],
                        ),
                      ],
                    ).paddingAll(25.webT(context)),
                  ).paddingSymmetric(horizontal: 48.webW(context)),
                  20.webHeight(context),
                  Container(
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        border: Border.all(
                            color: borderColor, width: 1.webT(context)),
                        borderRadius: BorderRadius.circular(4.w)),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 620.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Order List".toText(
                                    fontSize: 16,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w600),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      "Monthly".toText(
                                        fontSize: 11,
                                        color: blackPrimary,
                                      ),
                                      5.webWidth(context),
                                      CustomImage(
                                          image: Images.iconDropDown,
                                          width: 12.w,
                                          height: 12.w),
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
                                  width: 85.w,
                                  child: "Email".toText(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: blackPrimary),
                                ),
                                SizedBox(
                                  width: 85.w,
                                  child: Row(
                                    children: [
                                      "Date".toText(
                                          fontSize: 11,
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
                                  width: 85.w,
                                  child: Row(
                                    children: [
                                      "Location".toText(
                                          fontSize: 11,
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
                                  width: 85.w,
                                  child: "Order Details".toText(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: blackPrimary),
                                ),
                                SizedBox(
                                  width: 85.w,
                                  child: "Amount".toText(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: blackPrimary),
                                ),
                                SizedBox(
                                  width: 85.w,
                                  child: Row(
                                    children: [
                                      "Status".toText(
                                          fontSize: 11,
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
                                  width: 85.w,
                                  child: "Platform".toText(
                                      fontSize: 11,
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
                                        width: 85.w,
                                        child: "heleenvdm@gmail.com".toText(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: blackPrimary),
                                      ),
                                      SizedBox(
                                        width: 85.w,
                                        child: "21 Nov 2021".toText(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: blackPrimary),
                                      ),
                                      SizedBox(
                                        width: 85.w,
                                        child: "Cape Town, ZA".toText(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: blackPrimary),
                                      ),
                                      SizedBox(
                                        width: 85.w,
                                        child: "App Purchase".toText(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: blackPrimary),
                                      ),
                                      SizedBox(
                                        width: 85.w,
                                        child: "ZAR 39.00".toText(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w400,
                                            color: blackPrimary),
                                      ),
                                      SizedBox(
                                        width: 85.w,
                                        child: Container(
                                          width: 50.w,
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
                                                  backgroundColor:
                                                      index % 2 == 0
                                                          ? redPrimary
                                                          : greenPrimary,
                                                  radius: 5.webT(context)),
                                              2.width,
                                              "Charged".toText(
                                                fontSize: 11,
                                                color: blackPrimary,
                                              ),
                                            ],
                                          )
                                              .paddingSymmetric(
                                                  horizontal: 3.w,
                                                  vertical: 2.h)
                                              .center,
                                        )
                                            .align(Alignment.centerLeft)
                                            .paddingOnly(
                                                right: 30.webW(context)),
                                      ),
                                      SizedBox(
                                        width: 208.webW(context),
                                        child: "Android".toText(
                                            fontSize: 11,
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
                                  ).paddingSymmetric(
                                      vertical: 20.webT(context));
                                },
                                itemCount: 10)
                          ],
                        ).paddingAll(18.webT(context)),
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 48.webW(context)),
                  20.webHeight(context),
                ],
              ),
            );
          }),
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
      width: MediaQuery.of(context).size.width / 2 - 50.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleNumber.toText(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: blackPrimary),
              Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(5.w),
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
                  width: 12.w,
                  height: 12.w,
                ).center,
              ),
            ],
          ),
          title.toText(fontSize: 14, color: blackPrimary),
          7.height,
          Row(
            children: [
              CustomImage(
                image: arrowIcon,
                width: 12.w,
                height: 12.w,
              ),
              4.width,
              titlePercentage.toText(fontSize: 8),
              4.width,
              titleDescription.toText(fontSize: 14),
            ],
          )
        ],
      ),
    );
  }
}
