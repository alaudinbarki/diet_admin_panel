import 'package:base_code/helper/routes_helper.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/date_time_format.dart';
import 'package:base_code/utils/images.dart';
// import 'package:base_code/view/screens/dashboard/components/custom_popup_menu.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/user_provider.dart';
import '../../../../widgets/web_header.dart';

class UserListingWidget extends StatelessWidget {
  const UserListingWidget({super.key});

//   @override
//   State<UserListingWidget> createState() => _UserListingWidgetState();
// }

// class _UserListingWidgetState extends State<UserListingWidget> {
  // UserProvider? userProvider;
  // @override
  // void initState() {
  //   super.initState();
  //   userProvider = Provider.of<UserProvider>(context, listen: false);
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, controller, child) {
      return Container(
        height: 1294.webH(context),
        color: backgroundColor,
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : SingleChildScrollView(
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
                    //           CustomImage(
                    //               image: Images.iconProfileImage,
                    //               width: 50.webT(context),
                    //               height: 50.webT(context)),
                    //           10.webWidth(context),
                    //           "Marci Fumons".toTextWeb(
                    //               context: context,
                    //               fontSize: 22,
                    //               color: blackPrimary),
                    //           CustomPopupMenuButton()
                    //         ],
                    //       )
                    //     ],
                    //   ).paddingSymmetric(horizontal: 50.webW(context)),
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "App Users"
                            .toTextWeb(
                                context: context,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: blackPrimary)
                            .paddingSymmetric(vertical: 20.webT(context)),
                        Container(
                          height: 110.webT(context),
                          decoration: BoxDecoration(
                              color: whitePrimary,
                              borderRadius:
                                  BorderRadius.circular(13.webT(context))),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 80.webT(context),
                                    height: 4.webT(context),
                                    decoration: BoxDecoration(
                                        color: bluePrimary,
                                        borderRadius: BorderRadius.only(
                                          bottomRight:
                                              Radius.circular(5.webT(context)),
                                          bottomLeft:
                                              Radius.circular(5.webT(context)),
                                        )),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      "All".toTextWeb(
                                          context: context,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: bluePrimary),
                                      7.webWidth(context),
                                      Container(
                                        height: 30.webT(context),
                                        width: 40.webT(context),
                                        decoration: BoxDecoration(
                                            color: blueSecondary,
                                            borderRadius: BorderRadius.circular(
                                                20.webT(context))),
                                        child: "256"
                                            .toTextWeb(
                                                context: context,
                                                fontSize: 14,
                                                color: whitePrimary)
                                            .center,
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
                                    width: 80.webT(context),
                                    height: 4.webT(context),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                          bottomRight:
                                              Radius.circular(5.webT(context)),
                                          bottomLeft:
                                              Radius.circular(5.webT(context)),
                                        )),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      "Android".toTextWeb(
                                          context: context,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: textGreyColor),
                                      7.webWidth(context),
                                      Container(
                                        height: 30.webT(context),
                                        width: 40.webT(context),
                                        decoration: BoxDecoration(
                                            color: blueSecondary,
                                            borderRadius: BorderRadius.circular(
                                                20.webT(context))),
                                        child: "256"
                                            .toTextWeb(
                                                context: context,
                                                fontSize: 14,
                                                color: whitePrimary)
                                            .center,
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
                                    width: 80.webT(context),
                                    height: 4.webT(context),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                          bottomRight:
                                              Radius.circular(5.webT(context)),
                                          bottomLeft:
                                              Radius.circular(5.webT(context)),
                                        )),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      "iOS".toTextWeb(
                                          context: context,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: textGreyColor),
                                      7.webWidth(context),
                                      Container(
                                        height: 30.webT(context),
                                        width: 40.webT(context),
                                        decoration: BoxDecoration(
                                            color: blueSecondary,
                                            borderRadius: BorderRadius.circular(
                                                20.webT(context))),
                                        child: "256"
                                            .toTextWeb(
                                                context: context,
                                                fontSize: 14,
                                                color: whitePrimary)
                                            .center,
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
                                    // width: 80.webT(context),
                                    height: 4.webT(context),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                          bottomRight:
                                              Radius.circular(5.webT(context)),
                                          bottomLeft:
                                              Radius.circular(5.webT(context)),
                                        )),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      "Active Subscribers".toTextWeb(
                                          context: context,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: textGreyColor),
                                      7.webWidth(context),
                                      Container(
                                        height: 30.webT(context),
                                        width: 40.webT(context),
                                        decoration: BoxDecoration(
                                            color: blueSecondary,
                                            borderRadius: BorderRadius.circular(
                                                20.webT(context))),
                                        child: "256"
                                            .toTextWeb(
                                                context: context,
                                                fontSize: 14,
                                                color: whitePrimary)
                                            .center,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ],
                          )
                              .center
                              .paddingSymmetric(horizontal: 63.webT(context)),
                        ).paddingOnly(bottom: 50.webT(context)),
                        Container(
                          // height: 1200.webT(context),
                          decoration: BoxDecoration(
                              color: whitePrimary,
                              borderRadius:
                                  BorderRadius.circular(13.webT(context))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "All Users"
                                  .toTextWeb(
                                      context: context,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: blackPrimary)
                                  .paddingSymmetric(vertical: 20.webT(context)),
                              Container(
                                height: 100.webT(context),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(13.webT(context)),
                                  color: greyButtonColor,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    WebTextField(
                                      controller: TextEditingController(),
                                      width: 700.webT(context),
                                      prefixIcon: CustomImage(
                                        image: Images.iconSearch,
                                        width: 20.webT(context),
                                        height: 20.webT(context),
                                        iconColor: bluePrimary,
                                      ).paddingAll(20.webT(context)),
                                      hintText: "Search",
                                    ),
                                    WebTextField(
                                      controller: TextEditingController(),
                                      width: 120.webT(context),
                                      hintText: "From Date",
                                    ),
                                    WebTextField(
                                      controller: TextEditingController(),
                                      width: 120.webT(context),
                                      hintText: "From Date",
                                    ),
                                    Container(
                                      width: 135.webT(context),
                                      height: 45.webH(context),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: greyLight),
                                          borderRadius: BorderRadius.circular(
                                              10.webT(context)),
                                          color: whitePrimary),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomImage(
                                              image: Images.iconFilterUser,
                                              width: 24.webT(context),
                                              height: 24.webT(context)),
                                          15.webScaleWidth(context),
                                          "Filter".toTextWeb(
                                              context: context,
                                              fontSize: 16,
                                              color: bluePrimary)
                                        ],
                                      ).center,
                                    ).center,
                                    Container(
                                      width: 135.webT(context),
                                      height: 45.webH(context),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: greyLight),
                                          borderRadius: BorderRadius.circular(
                                              10.webT(context)),
                                          color: whitePrimary),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomImage(
                                              image: Images.iconExport,
                                              width: 24.webT(context),
                                              height: 24.webT(context)),
                                          15.webScaleWidth(context),
                                          "Export".toTextWeb(
                                              context: context,
                                              fontSize: 16,
                                              color: bluePrimary)
                                        ],
                                      ).center,
                                    ).center,
                                  ],
                                ).center.paddingSymmetric(
                                    horizontal: 40.webT(context)),
                              ),
                              25.webHeight(context),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100.webW(context),
                                    child: CustomImage(
                                      image: Images.iconDelete,
                                      width: 30.webT(context),
                                      height: 30.webT(context),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 244.webW(context),
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
                                    ),
                                  ),
                                  SizedBox(
                                    width: 230.webW(context),
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
                                    width: 214.webW(context),
                                    child: Row(
                                      children: [
                                        "Join date".toTextWeb(
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
                                    width: 214.webW(context),
                                    child: Row(
                                      children: [
                                        "Last login".toTextWeb(
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
                                    width: 214.webW(context),
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
                                    width: 214.webW(context),
                                    child: Row(
                                      children: [
                                        "Lifetime".toTextWeb(
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.webT(context)),
                                                    border: Border.all(
                                                        color: textGreyColor)),
                                              ).paddingSymmetric(
                                                horizontal: 36.webT(context),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 244.webW(context),
                                              child: Row(
                                                children: [
                                                  CustomImage(
                                                      image:
                                                          Images.iconDummyImage,
                                                      width: 40.webT(context),
                                                      height: 40.webT(context)),
                                                  16.webWidth(context),
                                                  controller
                                                      .userList[index].name
                                                      .toTextWeb(
                                                          context: context,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: blackPrimary),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 230.webW(context),
                                              child: "Windhoek, NAM".toTextWeb(
                                                  context: context,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: blackPrimary),
                                            ),
                                            SizedBox(
                                              width: 214.webW(context),
                                              // child: "18-Feb-19  05:49".toTextWeb(
                                              child: formatDate(controller
                                                      .userList[index].joinDate)
                                                  .toTextWeb(
                                                      context: context,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: blackPrimary),
                                            ),
                                            SizedBox(
                                              width: 214.webW(context),
                                              // child: "04-Aug-19  14:08".toTextWeb(
                                              child: formatDate(controller
                                                      .userList[index]
                                                      .lastLogin)
                                                  .toTextWeb(
                                                      context: context,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: blackPrimary),
                                            ),
                                            SizedBox(
                                              width: 214.webW(context),
                                              child: Container(
                                                width: 125.webW(context),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.webT(context)),
                                                  color: whitePrimary,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color:
                                                          Colors.grey.shade100,
                                                      offset:
                                                          const Offset(0, 3),
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
                                                        radius:
                                                            5.webT(context)),
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
                                                        horizontal:
                                                            12.webW(context),
                                                        vertical:
                                                            5.webH(context))
                                                    .center,
                                              )
                                                  .align(Alignment.centerLeft)
                                                  .paddingOnly(
                                                      right: 30.webW(context)),
                                            ),
                                            SizedBox(
                                              width: 214.webW(context),
                                              child: "ZAR432.56".toTextWeb(
                                                  context: context,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: blackPrimary),
                                            ),
                                          ],
                                        ).onPress(() {
                                          Navigator.pushNamed(context,
                                              RouterHelper.userDetailScreen);
                                        }),
                                        if (index == 14)
                                          Container(
                                            height: 75.webT(context),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      13.webT(context)),
                                              color: greyButtonColor,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    "1 ".toTextWeb(
                                                        context: context,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: bluePrimary),
                                                    "- 20 of 1 256".toTextWeb(
                                                        context: context,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: textGreyColor),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    "Entries per page"
                                                        .toTextWeb(
                                                            context: context,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                textGreyColor),
                                                    15.webWidth(context),
                                                    Container(
                                                      width: 80.webT(context),
                                                      height: 40.webT(context),
                                                      decoration: BoxDecoration(
                                                        color: whitePrimary,
                                                        border: Border.all(
                                                            color:
                                                                greyButtonColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                16.webT(
                                                                    context)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: blueSecondary
                                                                .withOpacity(
                                                                    0.2),
                                                            offset:
                                                                const Offset(
                                                                    0, 3),
                                                            blurRadius: 1,
                                                            spreadRadius: 1,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          "25".toTextWeb(
                                                              context: context,
                                                              fontSize: 16,
                                                              color:
                                                                  bluePrimary),
                                                          6.webWidth(context),
                                                          CustomImage(
                                                            image: Images
                                                                .iconDropDown,
                                                            width: 24
                                                                .webT(context),
                                                            height: 24
                                                                .webT(context),
                                                            iconColor:
                                                                bluePrimary,
                                                          ),
                                                        ],
                                                      ).center,
                                                    ),
                                                    Container(
                                                      height: 33.webT(context),
                                                      width: 1.webT(context),
                                                      color: greyLight,
                                                    ).paddingSymmetric(
                                                        horizontal:
                                                            15.webT(context)),
                                                    Container(
                                                      width: 40.webT(context),
                                                      height: 40.webT(context),
                                                      decoration: BoxDecoration(
                                                        color: whitePrimary,
                                                        border: Border.all(
                                                            color:
                                                                greyButtonColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                16.webT(
                                                                    context)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: blueSecondary
                                                                .withOpacity(
                                                                    0.2),
                                                            offset:
                                                                const Offset(
                                                                    0, 3),
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
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: bluePrimary)
                                                        .paddingSymmetric(
                                                            horizontal: 15
                                                                .webT(context)),
                                                    Container(
                                                      width: 40.webT(context),
                                                      height: 40.webT(context),
                                                      decoration: BoxDecoration(
                                                        color: whitePrimary,
                                                        border: Border.all(
                                                            color:
                                                                greyButtonColor),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                16.webT(
                                                                    context)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: blueSecondary
                                                                .withOpacity(
                                                                    0.2),
                                                            offset:
                                                                const Offset(
                                                                    0, 3),
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
                                          ).paddingSymmetric(
                                              vertical: 20.webT(context)),
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
                                  itemCount: controller.userList.length)
                            ],
                          )
                              .center
                              .paddingSymmetric(horizontal: 40.webT(context)),
                        ),
                        20.webScaleHeight(context)
                      ],
                    ).paddingSymmetric(horizontal: 50.webT(context)),
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
}
