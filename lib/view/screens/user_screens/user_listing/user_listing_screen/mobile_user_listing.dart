

import 'dart:io';

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
import '../../../dashboard/components/custom_drawer.dart';
import '../../../dashboard/components/custom_popup_menu.dart';

class MobileUserListingScreen extends StatefulWidget {
  const MobileUserListingScreen({Key? key}) : super(key: key);

  @override
  State<MobileUserListingScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<MobileUserListingScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  ScrollController secondScrollController = ScrollController();

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
          drawer: CustomDrawer(fromMobile: true,),
          appBar: AppBar(
            // toolbarHeight: 50.h,
            backgroundColor: whitePrimary,
            leading: Icon(Icons.menu, color: bluePrimary, size: 20.w,).onPress(() {
              scaffoldKey.currentState!.openDrawer();
            }),
            actions: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImage(image: Images.iconProfileImage, width: 12.w, height: 12.w),
                  4.width,
                  "Marci Fumons".toText(fontSize: 12, color: blackPrimary),
                  CustomPopupMenuButton(fromMobile: true,),
                ],
              )
            ],
          ),

          body: Consumer<AuthProvider>(builder: (context, controller, child) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  "App Users".toText( fontSize: 16, fontWeight: FontWeight.bold, color: blackPrimary).paddingSymmetric(vertical: 10.h).align(Alignment.centerLeft).center.paddingSymmetric(horizontal: 15.w),

                  20.height,
                  Container(
                    height: 65.h,
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        borderRadius: BorderRadius.circular(13.w),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 55.w,
                              height: 4.w,
                              decoration: BoxDecoration(
                                  color: bluePrimary,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5.w),
                                    bottomLeft: Radius.circular(5.w),
                                  )
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                "All".toText( fontSize: 15, fontWeight: FontWeight.w600, color: bluePrimary),
                                7.webWidth(context),
                                Container(
                                  height: 28.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      color: blueSecondary,
                                      borderRadius: BorderRadius.circular(20.w)
                                  ),
                                  child: "256".toText( fontSize: 12, color: whitePrimary).center,
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                        30.webWidth(context),
                        Column(
                          children: [
                            Container(
                              width: 55.w,
                              height: 4.w,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5.w),
                                    bottomLeft: Radius.circular(5.w),
                                  )
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                "Android".toText( fontSize: 15, fontWeight: FontWeight.w600, color: textGreyColor),
                                7.webWidth(context),
                                Container(
                                  height: 28.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      color: blueSecondary,
                                      borderRadius: BorderRadius.circular(20.w)
                                  ),
                                  child: "256".toText( fontSize: 12, color: whitePrimary).center,
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                        30.webWidth(context),
                        Column(
                          children: [
                            Container(
                              width: 55.w,
                              height: 4.w,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5.w),
                                    bottomLeft: Radius.circular(5.w),
                                  )
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                "iOS".toText( fontSize: 15, fontWeight: FontWeight.w600, color: textGreyColor),
                                7.webWidth(context),
                                Container(
                                  height: 28.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      color: blueSecondary,
                                      borderRadius: BorderRadius.circular(20.w)
                                  ),
                                  child: "256".toText( fontSize: 12, color: whitePrimary).center,
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                        30.webWidth(context),
                        Column(
                          children: [
                            Container(
                              width: 55.w,
                              height: 4.w,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5.w),
                                    bottomLeft: Radius.circular(5.w),
                                  )
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                "Active Subscribers".toText( fontSize: 15, fontWeight: FontWeight.w600, color: textGreyColor),
                                7.webWidth(context),
                                Container(
                                  height: 28.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      color: blueSecondary,
                                      borderRadius: BorderRadius.circular(20.w)
                                  ),
                                  child: "256".toText( fontSize: 12, color: whitePrimary).center,
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ).center.paddingSymmetric(horizontal: 15.w),
                  ).paddingOnly(bottom: 10.h),

                  Container(
                    // height: 1200.w,
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        borderRadius: BorderRadius.circular(5.w)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "All Users".toText( fontSize: 16, fontWeight: FontWeight.bold, color: blackPrimary),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.w),
                            color: greyButtonColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomTextField(
                                    controller: TextEditingController(),
                                    width: 225.w,
                                    prefixIcon: CustomImage(image: Images.iconSearch, width: 12.w, height: 12.w, iconColor: bluePrimary,).paddingAll(5.w),
                                    hintText: "Search",
                                  ),
                                  5.width,
                                  Container(
                                    width: 85.w,
                                    height: 55.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: greyLight),
                                        borderRadius: BorderRadius.circular(3.w),
                                        color: whitePrimary
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CustomImage(image: Images.iconFilterUser, width: 12.w, height: 12.w),
                                        4.width,
                                        "Filter".toText( fontSize: 1, color: bluePrimary)
                                      ],
                                    ).center,
                                  ).center,
                                ],
                              ),
                              5.height,
                              Row(
                                children: [
                                  CustomTextField(
                                    controller: TextEditingController(),
                                    width: 100.w,
                                    hintText: "From Date",
                                  ),
                                  5.width,
                                  CustomTextField(
                                    controller: TextEditingController(),
                                    width: 100.w,
                                    hintText: "From Date",
                                  ),
                                  5.width,
                                  Container(
                                    width: 85.w,
                                    height: 55.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: greyLight),
                                        borderRadius: BorderRadius.circular(3.w),
                                        color: whitePrimary
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CustomImage(image: Images.iconExport, width: 12.w, height: 12.w),
                                        4.width,
                                        "Export".toText( fontSize: 11, color: bluePrimary)
                                      ],
                                    ).center,
                                  ).center,
                                ],
                              ),
                            ],
                          ).center.paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                        ),

                        25.webHeight(context),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 640.w,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 85.w,
                                      child: CustomImage(image: Images.iconDelete, width: 12.w, height: 12.w,),
                                    ),
                                    SizedBox(
                                      width: 115.w,
                                      child: Row(
                                        children: [
                                          "Name and surname".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary),
                                          CustomImage(image: Images.iconFilter, width: 12.w, height: 12.w)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 85.w,
                                      child: Row(
                                        children: [
                                          "Location".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary),
                                          CustomImage(image: Images.iconFilter, width: 12.w, height: 12.w)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80.w,
                                      child: Row(
                                        children: [
                                          "Join date".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary),
                                          CustomImage(image: Images.iconFilter, width: 12.w, height: 12.w)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80.w,
                                      child: Row(
                                        children: [
                                          "Last login".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary),
                                          CustomImage(image: Images.iconFilter, width: 12.w, height: 12.w)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                      child: Row(
                                        children: [
                                          "Status".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary),
                                          CustomImage(image: Images.iconFilter, width: 12.w, height: 12.w)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80.w,
                                      child: Row(
                                        children: [
                                          "Lifetime".toText( fontSize: 12, fontWeight: FontWeight.w600, color: blackPrimary),
                                          CustomImage(image: Images.iconFilter, width: 12.w, height: 12.w)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(height: 1.webH(context), color: dividerColor,).paddingSymmetric(vertical: 20.w),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 85.w,
                                              child: Container(
                                                width: 15.w,
                                                height: 15.w,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5.w),
                                                    border: Border.all(color: textGreyColor)
                                                ),
                                              ).paddingSymmetric(horizontal: 35.w,),
                                            ),
                                            SizedBox(
                                              width: 120.w,
                                              child: Row(
                                                children: [
                                                  CustomImage(image: Images.iconDummyImage, width: 22.w, height: 22.w),
                                                  4.width,
                                                  SizedBox(width: 65.w, child: "Poppie van Staden".toText( fontSize: 12, fontWeight: FontWeight.w400, color: blackPrimary)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 85.w,
                                              child: "Windhoek, NAM".toText( fontSize: 12, fontWeight: FontWeight.w400, color: blackPrimary),
                                            ),
                                            SizedBox(
                                              width: 80.w,
                                              child: "18-Feb-19  05:49".toText( fontSize: 12, fontWeight: FontWeight.w400, color: blackPrimary),
                                            ),
                                            SizedBox(
                                              width: 80.w,
                                              child: "04-Aug-19  14:08".toText( fontSize: 12, fontWeight: FontWeight.w400, color: blackPrimary),
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                              child: Container(
                                                width: 80.w,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10.w),
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
                                                    2.width,
                                                    index %2 == 0
                                                        ? "Basic".toText( fontSize: 10, color: blackPrimary,)
                                                        : "Active".toText( fontSize: 10, color: blackPrimary,),
                                                  ],
                                                ).paddingSymmetric(horizontal: 12.w, vertical: 3.h).center,
                                              ).align(Alignment.centerLeft).paddingOnly(right: 40.w),
                                            ),
                                            SizedBox(
                                              width: 80.w,
                                              child: "ZAR432.56".toText( fontSize: 12, fontWeight: FontWeight.w400, color: blackPrimary),
                                            ),
                                          ],
                                        ).onPress(() {
                                          Navigator.pushNamed(context, RouterHelper.userDetailScreen);
                                        }),
                                        if(index == 14)
                                          Container(
                                            height: 60.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(13.w),
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
                                                      height: 20.w,
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
                                                          CustomImage(image: Images.iconDropDown, width: 14.w, height: 14.w, iconColor: bluePrimary,),
                                                        ],
                                                      ).center,
                                                    ),
                                                    Container(
                                                      height: 33.h,
                                                      width: 1.w,
                                                      color: greyLight,
                                                    ).paddingSymmetric(horizontal: 15.w),
                                                    Container(
                                                      width: 20.w,
                                                      height: 20.w,
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
                                                      child: Icon(Icons.arrow_back, color: greyLight, size: 16.w,).center,
                                                    ),
                                                    "of 29".toText( fontSize: 12, fontWeight: FontWeight.w500, color: bluePrimary).paddingSymmetric(horizontal: 15.w),
                                                    Container(
                                                      width: 20.w,
                                                      height: 20.w,
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
                                                      child: Icon(Icons.arrow_forward, color: bluePrimary, size: 16.w,).center,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ).center.paddingSymmetric(horizontal: 30.w),
                                          ).paddingSymmetric(vertical: 30.w),

                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Container(height: 1.webH(context), color: dividerColor,).paddingSymmetric(vertical: 20.w);
                                  },
                                  itemCount: 15
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ).center.paddingSymmetric(horizontal: 15.w),
                  ),

                  20.webScaleHeight(context)
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
      width: 280.webW(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleNumber.toText( fontSize: 36, fontWeight: FontWeight.w600, color: blackPrimary),
              Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(12.w),
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
                  width: 25.w,
                  height: 25.w,
                ).center,
              ),
            ],
          ),
          title.toText( fontSize: 22, color: blackPrimary),
          15.webHeight(context),
          Row(
            children: [
              CustomImage(
                image: arrowIcon,
                width: 25.w,
                height: 25.w,
              ),
              10.webWidth(context),
              titlePercentage.toText( fontSize: 18),
              15.webWidth(context),
              titleDescription.toText( fontSize: 18),
            ],
          )
        ],
      ),
    );
  }


}
