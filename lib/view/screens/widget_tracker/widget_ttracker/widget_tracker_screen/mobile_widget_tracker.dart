

import 'package:base_code/helper/validation.dart';
import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/constant.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../helper/routes_helper.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/style.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/web_widgets/web_custom_button.dart';
import '../../../dashboard/components/custom_drawer.dart';
import '../../../dashboard/components/custom_popup_menu.dart';
import 'components/line_chart_widget_tracker.dart';
import 'components/widget_tracker_data.dart';

class MobileWidgetTracker extends StatefulWidget {
  const MobileWidgetTracker({Key? key}) : super(key: key);

  @override
  State<MobileWidgetTracker> createState() => _MobileUserDetailState();
}

class _MobileUserDetailState extends State<MobileWidgetTracker> {
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
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100.h,
                        // width: 200.w,
                        decoration: BoxDecoration(
                            color: whitePrimary,
                            border: Border.all(color: borderColor, width: 1.webT(context)),
                            borderRadius: BorderRadius.circular(7.w)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            renderingDetailBox(context, "Active User", "400", Images.iconActiveUser, Images.iconArrowUp, "10.2", "+1.01% this week"),
                            5.width,
                            Container(color: dividerColor, width: 1.w),
                            5.width,
                            renderingDetailBox(context, "Earnings this month", "R7 856.25", Images.iconThisMonth, Images.iconArrowUp, "3.1", "+0.49% this week"),
                          ],
                        ).paddingAll(18.webT(context)),
                      ),

                    ],
                  ).paddingSymmetric(horizontal: 10.w),
                  10.height,
                  Row(
                    children: [
                      renderingDetailBox(context, "Total User", "46 827", Images.iconTotalUser, Images.iconArrowDown, "2.56", "-0.91% this week"),
                      11.width,
                      Container(
                        width: 150.w,
                        // height: 100.h,
                        decoration: BoxDecoration(
                            color: blueSecondary.withOpacity(0.5),
                            border: Border.all(color: blueSecondary, width: 1.webT(context)),
                            borderRadius: BorderRadius.circular(5.w)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Date range".toText( fontSize: 16, fontWeight: FontWeight.w600, color: blackPrimary),
                            "21 Nov 2022 - 29 Nov 2022".toText( fontSize: 12, color: containerTextColor),
                            5.height,
                            CustomButton(
                              buttonName: "Pick a Date",
                              onPressed: () {
                                controller.selectDate(context);
                              },
                              buttonColor: bluePrimary,
                              buttonTextColor: whitePrimary,
                              borderColor: bluePrimary,
                              width: 145.w,
                              radius: 5.w,
                              textSize: 10,
                              height: 30.h,
                            ),
                          ],
                        ).paddingAll(15.webT(context)),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10.w),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 350.w,
                        // height: 460.webT(context),
                        decoration: BoxDecoration(
                            color: whitePrimary,
                            border: Border.all(color: borderColor, width: 1.webT(context)),
                            borderRadius: BorderRadius.circular(7.w)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Total Weight Loss".toText( fontSize: 16, fontWeight: FontWeight.w500, color: blackPrimary),
                                Row(
                                  children: [
                                    Container(
                                      width: 4.w,
                                      height: 4.w,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: allUserLineColor
                                      ),
                                    ),
                                    5.width,
                                    "All User".toText( fontSize: 10, fontWeight: FontWeight.w500, color: blackPrimary),
                                    5.width,
                                    Container(
                                      width: 4.w,
                                      height: 4.w,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: menLineColor
                                      ),
                                    ),
                                    5.width,
                                    "Men".toText( fontSize: 10, fontWeight: FontWeight.w500, color: blackPrimary),
                                    5.width,
                                    Container(
                                      width: 4.w,
                                      height: 4.w,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: womenLineColor
                                      ),
                                    ),
                                    5.width,
                                    "Women".toText( fontSize: 10, fontWeight: FontWeight.w500, color: blackPrimary),
                                  ],
                                ),
                              ],
                            ),
                            LineChartWidgetTracker(fromMobile: true,),
                          ],
                        ).paddingOnly(left: 25.webT(context), right: 25.webT(context), top: 25.webT(context), bottom: 10.webT(context)),
                      ),

                    ],
                  ).paddingSymmetric(horizontal: 10.w),
                  20.webHeight(context),
                  Container(
                    width: 350.w,
                    // height: 460.webT(context),
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        border: Border.all(color: borderColor, width: 1.webT(context)),
                        borderRadius: BorderRadius.circular(16.webT(context))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Chart criteria".toText( fontSize: 16, fontWeight: FontWeight.w500, color: blackPrimary),
                        5.height,
                        "Gender".toText( fontSize: 12, fontWeight: FontWeight.w500, color: blackPrimary),
                        5.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 55.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  color: whitePrimary,
                                  border: Border.all(color: greenPrimary, width: 1.webT(context)),
                                  borderRadius: BorderRadius.circular(2.w)
                              ),
                              child: "All User".toText( fontSize: 8, fontWeight: FontWeight.w500, color: blackPrimary).center,
                            ),
                            5.width,
                            Container(
                              width: 55.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  color: whitePrimary,
                                  border: Border.all(color: bluePrimary, width: 1.webT(context)),
                                  borderRadius: BorderRadius.circular(2.w)
                              ),
                              child: "Men".toText( fontSize: 8, fontWeight: FontWeight.w500, color: blackPrimary).center,
                            ),
                            5.width,
                            Container(
                              width: 55.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  color: whitePrimary,
                                  border: Border.all(color: pinkPrimary, width: 1.webT(context)),
                                  borderRadius: BorderRadius.circular(2.w)
                              ),
                              child: "Women".toText( fontSize: 8, fontWeight: FontWeight.w500, color: blackPrimary).center,
                            ),
                          ],
                        ),
                        5.height,
                        "Gender".toText( fontSize: 12, fontWeight: FontWeight.w500, color: blackPrimary),
                        5.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for(int i=0;i<7;i++)
                              Row(
                                children: [
                                  Container(
                                    width: 15.w,
                                    height: 15.w,
                                    decoration: BoxDecoration(
                                        color: whitePrimary,
                                        border: Border.all(color: greyPrimary, width: 1.webT(context)),
                                        borderRadius: BorderRadius.circular(15.w)
                                    ),
                                    child: (i + 1).toString().toText( fontSize: 8, fontWeight: FontWeight.w500, color: blackPrimary).center,
                                  ).paddingOnly(right: 7.webW(context)),
                                ],
                              ),
                          ],
                        ),
                        10.webHeight(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for(int i=7;i<14;i++)
                              Row(
                                children: [
                                  Container(
                                    width: 15.w,
                                    height: 15.w,
                                    decoration: BoxDecoration(
                                        color: whitePrimary,
                                        border: Border.all(color: greyPrimary, width: 1.webT(context)),
                                        borderRadius: BorderRadius.circular(15.w)
                                    ),
                                    child: (i + 1).toString().toText( fontSize: 8, fontWeight: FontWeight.w500, color: blackPrimary).center,
                                  ).paddingOnly(right: 7.webW(context)),
                                ],
                              ),
                          ],
                        ),
                        10.webHeight(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for(int i=14;i<21;i++)
                              Row(
                                children: [
                                  Container(
                                    width: 15.w,
                                    height: 15.w,
                                    decoration: BoxDecoration(
                                        color: whitePrimary,
                                        border: Border.all(color: greyPrimary, width: 1.webT(context)),
                                        borderRadius: BorderRadius.circular(15.w)
                                    ),
                                    child: (i + 1).toString().toText( fontSize: 8, fontWeight: FontWeight.w500, color: blackPrimary).center,
                                  ).paddingOnly(right: 7.webW(context)),
                                ],
                              ),
                          ],
                        ),
                        10.webHeight(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for(int i=21;i<28;i++)
                              Row(
                                children: [
                                  Container(
                                    width: 15.w,
                                    height: 15.w,
                                    decoration: BoxDecoration(
                                        color: whitePrimary,
                                        border: Border.all(color: greyPrimary, width: 1.webT(context)),
                                        borderRadius: BorderRadius.circular(15.w)
                                    ),
                                    child: (i + 1).toString().toText( fontSize: 8, fontWeight: FontWeight.w500, color: blackPrimary).center,
                                  ).paddingOnly(right: 7.webW(context)),
                                ],
                              ),
                          ],
                        ),
                        12.webHeight(context),
                        "Round".toText( fontSize: 12, fontWeight: FontWeight.w500, color: blackPrimary),
                        10.webHeight(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for(int i=0;i<6;i++)
                              Row(
                                children: [
                                  Container(
                                    width: 15.w,
                                    height: 15.w,
                                    decoration: BoxDecoration(
                                        color: whitePrimary,
                                        border: Border.all(color: iosLineColor, width: 1.webT(context)),
                                        borderRadius: BorderRadius.circular(2.w)
                                    ),
                                    child: (i + 1).toString().toText( fontSize: 8, fontWeight: FontWeight.w500, color: blackPrimary).center,
                                  ).paddingOnly(right: 7.webW(context)),
                                ],
                              ),
                          ],
                        ),

                      ],
                    ).paddingOnly(left: 25.webT(context), right: 25.webT(context), top: 25.webT(context), bottom: 10.webT(context)),
                  ),
                  10.height,
                  Container(
                    // height: 1200.webT(context),
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        borderRadius: BorderRadius.circular(13.webT(context))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Latest User Entries".toText( fontSize: 16, fontWeight: FontWeight.bold, color: blackPrimary).paddingSymmetric(vertical: 20.webT(context)),
                            Container(
                              width: 100.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.w),
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
                                  "Export".toText( fontSize: 12, color: whitePrimary,),
                                  5.width,
                                  CustomImage(image: Images.iconDropDown, width: 13.w, height: 13.w, iconColor: whitePrimary,),
                                ],
                              ).center,
                            ),
                          ],
                        ),
                        10.height,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 630.w,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 100.w,
                                      child: SizedBox(
                                        width: 25.w,
                                        child: Container(
                                          width: 14.w,
                                          height: 10.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.webT(context)),
                                              border: Border.all(color: textGreyColor)
                                          ),
                                        ).paddingSymmetric(horizontal: 45.w,),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      child: Row(
                                        children: [
                                          "Name and surname".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary),
                                          CustomImage(image: Images.iconFilter, width: 8.w, height: 8.w)
                                        ],
                                      ).center,
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      child: "Day on the Plan".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary).center,
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          "Date of Entry".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary),
                                          CustomImage(image: Images.iconFilter, width: 8.w, height: 8.w)
                                        ],
                                      ).center,
                                    ),
                                    SizedBox(
                                        width: 100.w,
                                        child: "Weight Change".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary).center
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          "Status".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary),
                                          CustomImage(image: Images.iconFilter, width: 8.w, height: 8.w)
                                        ],
                                      ).center,
                                    ),
                                  ],
                                ),
                                Container(height: 1.webH(context), color: dividerColor,).paddingSymmetric(vertical: 20.webT(context)),
                                ListView.separated(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 100.w,
                                                child: Container(
                                                  width: 14.w,
                                                  height: 10.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5.webT(context)),
                                                      border: Border.all(color: textGreyColor)
                                                  ),
                                                ).paddingSymmetric(horizontal: 45.w),
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: Row(
                                                  children: [
                                                    CustomImage(image: Images.iconDummyImage, width: 16.w, height: 16.w),
                                                    5.width,
                                                    SizedBox(width: 65.w,child: "Poppie van Staden".toText( fontSize: 12, fontWeight: FontWeight.w400, color: blackPrimary)),
                                                  ],
                                                ).center,
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: "Day 1".toText( fontSize: 12, fontWeight: FontWeight.w400, color: blackPrimary).center,
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: "18-Feb-19  05:49".toText( fontSize: 12, fontWeight: FontWeight.w400, color: blackPrimary).center,
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: "+1.2 kg".toText( fontSize: 12, fontWeight: FontWeight.w400, color: blackPrimary).center,
                                              ),
                                              SizedBox(
                                                width: 100.w,
                                                child: Container(
                                                  width: 80.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5.w),
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
                                                      CircleAvatar(backgroundColor: index %2 == 0 ? redPrimary : greenPrimary, radius: 3.w),
                                                      10.webWidth(context),
                                                      index %2 == 0
                                                          ? "Basic".toText( fontSize: 12, color: blackPrimary,)
                                                          : "Active".toText( fontSize: 12, color: blackPrimary,),
                                                    ],
                                                  ).paddingSymmetric(horizontal: 12.webW(context), vertical: 5.webH(context)).center,
                                                ).align(Alignment.center).paddingOnly(right: 10.w),
                                              ),
                                            ],
                                          ).onPress(() {
                                            // Navigator.pushNamed(context, RouterHelper.userDetailScreen);
                                          }),
                                          if(index == 14)
                                            Container(
                                              height: 75.h,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(13.webT(context)),
                                                color: greyButtonColor,
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      "1 ".toText( fontSize: 12, fontWeight: FontWeight.w500, color: bluePrimary),
                                                      "- 20 of 1 256".toText( fontSize: 12, fontWeight: FontWeight.w500, color: textGreyColor),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      "Entries per page".toText( fontSize: 12, fontWeight: FontWeight.w500, color: textGreyColor),
                                                      15.webWidth(context),
                                                      Container(
                                                        width: 40.w,
                                                        height: 30.h,
                                                        decoration: BoxDecoration(
                                                          color: whitePrimary,
                                                          border: Border.all(color: greyButtonColor),
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
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            "25".toText( fontSize: 12, color: bluePrimary),
                                                            6.webWidth(context),
                                                            CustomImage(image: Images.iconDropDown, width: 12.w, height: 12.w, iconColor: bluePrimary,),
                                                          ],
                                                        ).center,
                                                      ),
                                                      Container(
                                                        height: 33.webT(context),
                                                        width: 1.webT(context),
                                                        color: greyLight,
                                                      ).paddingSymmetric(horizontal: 15.webT(context)),
                                                      Container(
                                                        width: 16.w,
                                                        height: 16.w,
                                                        decoration: BoxDecoration(
                                                          color: whitePrimary,
                                                          border: Border.all(color: greyButtonColor),
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
                                                        child: Icon(Icons.arrow_back, color: greyLight, size: 12.w,).center,
                                                      ),
                                                      "of 29".toText( fontSize: 12, fontWeight: FontWeight.w500, color: bluePrimary).paddingSymmetric(horizontal: 15.webT(context)),
                                                      Container(
                                                        width: 16.w,
                                                        height: 16.w,
                                                        decoration: BoxDecoration(
                                                          color: whitePrimary,
                                                          border: Border.all(color: greyButtonColor),
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
                                                        child: Icon(Icons.arrow_forward, color: bluePrimary, size: 12.w,).center,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ).center.paddingSymmetric(horizontal: 40.webT(context)),
                                            ).paddingSymmetric(vertical: 20.webT(context)),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Container(height: 1.webH(context), color: dividerColor,).paddingSymmetric(vertical: 20.webT(context));
                                    },
                                    itemCount: 15
                                ),
                                10.height
                              ],
                            ),
                          ),
                        ),

                      ],
                    ).center.paddingSymmetric(horizontal: 40.webT(context)),
                  ).paddingSymmetric(horizontal: 10.w),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  renderingDetailBox(BuildContext context, String title, String titleNumber, String titleIcon, String arrowIcon, String titlePercentage, String titleDescription) {
    return SizedBox(
      width: 150.w,
      height: 100.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleNumber.toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary),
              Container(
                width: 16.w,
                height: 16.w,
                decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(7.w),
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
          title.toText( fontSize: 10, color: blackPrimary),
          5.height,
          Row(
            children: [
              CustomImage(
                image: arrowIcon,
                width: 12.w,
                height: 12.w,
              ),
              3.width,
              titlePercentage.toText( fontSize: 10),
              3.width,
              titleDescription.toText( fontSize: 10),
            ],
          )
        ],
      ),
    );
  }

}
