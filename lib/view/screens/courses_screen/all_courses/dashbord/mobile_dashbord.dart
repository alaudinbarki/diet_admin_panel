import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../../data/model/custom_model/tab_item_model.dart';
import '../../../../../helper/routes_helper.dart';
import '../../../../../provider/recepie_provider.dart';
import '../../../../../utils/colors.dart';
import '../../../../../utils/images.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../dashboard/components/custom_drawer.dart';
import '../../../dashboard/components/custom_popup_menu.dart';

class MobileCoursesDashbord extends StatefulWidget {
  const MobileCoursesDashbord({super.key});

  @override
  State<MobileCoursesDashbord> createState() => _MobileCoursesDashbordState();
}

class _MobileCoursesDashbordState extends State<MobileCoursesDashbord> {
  int _selectedIndex = 0; // Track the selected index

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: SafeArea(
          key: scaffoldKey,
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
                          width: 12.w,
                          height: 12.w),
                      4.width,
                      "Marci Fumons".toText(fontSize: 12, color: blackPrimary),
                      CustomPopupMenuButton(
                        fromMobile: true,
                      )
                    ],
                  )
                ],
              ),
              
              body:
                  Consumer<RecepieProvider>(builder: (context, controller, _) {
                return Container(
                  color: backgroundColor,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            30.height,
                            'Courses'.toText(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: blackPrimary),
                            29.height,
                            Container(
                              decoration: BoxDecoration(
                                color: whitePrimary,
                                border: Border.all(
                                  color: borderColor,
                                  width: 1.w,
                                ),
                                borderRadius: BorderRadius.circular(16.h),
                              ),
                              height: 65.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: controller.courseTabs
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int idx = entry.key;
                                  TabItem title = entry.value;
                                  bool isSelected = _selectedIndex == idx;
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex = idx;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        isSelected
                                            ? title.label.toText(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: purplePrimary)
                                            : title.label.toText(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: greyDark),
                                        10.width,
                                        Container(
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
                                              .toText(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: whitePrimary)
                                              .paddingSymmetric(
                                                  vertical: 3.w,
                                                  horizontal: 4.w),
                                        ),
                                      ],
                                    ).paddingOnly(left: 20.h, right: 20.h),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 48.h),
                        50.height,
                        AllRecepies(),
                        20.height,
                        Container(
                          decoration: BoxDecoration(
                              color: whitePrimary,
                              border:
                                  Border.all(color: borderColor, width: 1.w),
                              borderRadius: BorderRadius.circular(16.h)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              25.width,
                              Container(
                                  decoration: BoxDecoration(
                                      color: whitePrimary,
                                      borderRadius:
                                          BorderRadius.circular(30.w)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      35.height,
                                      "Course Settings".toText(
                                          fontSize: 15,
                                          color: blackPrimary,
                                          fontWeight: FontWeight.w600),
                                      35.height,
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              "Primary Category".toText(
                                                  fontSize: 12,
                                                  color: blackPrimary,
                                                  fontWeight: FontWeight.w600),
                                              16.height,
                                              Container(
                                                height: 57.h,
                                                width: 150.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.webT(context)),
                                                    border: Border.all(
                                                      color:
                                                          greyLight, // Color of the border
                                                      width:
                                                          1, // Width of the border
                                                    )),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: DropdownButton<String>(
                                                    value: controller
                                                        .dropdownValue,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10
                                                                .webT(context)),
                                                    icon: const Icon(Icons
                                                        .keyboard_arrow_down_outlined),
                                                    elevation: 16,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: blackPrimary,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),

                                                    onChanged:
                                                        (String? newValue) {
                                                      controller.dropdownValue =
                                                          newValue!;
                                                      controller.notifer();
                                                    },
                                                    items: controller.items.map<
                                                            DropdownMenuItem<
                                                                String>>(
                                                        (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: value.toText(
                                                            fontSize: 12,
                                                            color: blackPrimary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      );
                                                    }).toList(),
                                                    // Adding the rounded border by wrapping the DropdownButton with DecoratedBox
                                                    dropdownColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          30.width,
                                          CustomTextField(
                                            height: 57.h,
                                            width: 140.w,
                                            label: "Bulk Discount %",
                                            radius: 15.h,
                                            controller: TextEditingController(),
                                            hintText:
                                                "Percentage to discount all courses",
                                            textInputAction:
                                                TextInputAction.next,
                                          ),
                                        ],
                                      ),
                                      15.height,
                                      Row(
                                        children: [
                                          CustomTextField(
                                            height: 57.h,
                                            width: 150.w,
                                            label: "Start Date",
                                            radius: 15.h,
                                            suffixIcon: const Icon(
                                                Icons.calendar_month),
                                            controller: TextEditingController(),
                                            hintText: "Select Date",
                                            textInputAction:
                                                TextInputAction.next,
                                          ),
                                          30.width,
                                          CustomTextField(
                                            height: 57.h,
                                            width: 150.w,
                                            label: "Select Date",
                                            radius: 15.h,
                                            suffixIcon: const Icon(
                                                Icons.calendar_month),
                                            controller: TextEditingController(),
                                            hintText: "End Date",
                                            textInputAction:
                                                TextInputAction.next,
                                          ),
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          ).paddingAll(18.h),
                        ).paddingSymmetric(horizontal: 10.w)
                      ],
                    ),
                  ),
                );
              }))),
    );
  }
}

class AllRecepies extends StatelessWidget {
  AllRecepies({super.key});
  List<bool> selectedRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<RecepieProvider>(builder: (context, controller, child) {
      return Container(
        decoration: BoxDecoration(
            color: whitePrimary,
            border: Border.all(color: borderColor, width: 1.w),
            borderRadius: BorderRadius.circular(16.h)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                'All Courses'.toText(
                    fontSize: 18,
                    color: blackPrimary,
                    fontWeight: FontWeight.w600),
                CustomButton(
                  buttonName: "New Courses",
                  textSize: 13,
                  onPressed: () {},
                  width: 200.w,
                  height: 45.h,
                  radius: 15.h,
                ),
              ],
            ),
            30.webHeight(context),
            Container(
              decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(5.w)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                              prefixIcon: CustomImage(
                                image: Images.iconSearch,
                                width: 12.w,
                                height: 12.w,
                                iconColor: bluePrimary,
                              ).paddingAll(5.w),
                              hintText: "Search",
                            ),
                            5.width,
                            Container(
                              width: 85.w,
                              height: 55.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: greyLight),
                                  borderRadius: BorderRadius.circular(3.w),
                                  color: whitePrimary),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomImage(
                                      image: Images.iconFilterUser,
                                      width: 12.w,
                                      height: 12.w),
                                  4.width,
                                  "Filter"
                                      .toText(fontSize: 1, color: bluePrimary)
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
                                  color: whitePrimary),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomImage(
                                      image: Images.iconExport,
                                      width: 12.w,
                                      height: 12.w),
                                  4.width,
                                  "Export"
                                      .toText(fontSize: 11, color: bluePrimary)
                                ],
                              ).center,
                            ).center,
                          ],
                        ),
                      ],
                    ).center.paddingSymmetric(horizontal: 10.w, vertical: 10.h),
                  ),
                ],
              ),
            ),
            20.height,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 700.w,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: const CategoryHeader(
                            title: 'Order',
                            imagePath: null,
                          ),
                        ),
                        SizedBox(
                          width: 90.w,
                          child: const CategoryHeader(
                            title: 'Title',
                            imagePath: Images.iconFilter,
                          ),
                        ),
                        SizedBox(
                          width: 90.w,
                          child: const CategoryHeader(
                            title: 'Active Enrollees',
                            imagePath: Images.iconFilter,
                          ),
                        ),
                        SizedBox(
                          width: 90.w,
                          child: const CategoryHeader(
                            title: 'Price ',
                            imagePath: null,
                          ).center,
                        ),
                        SizedBox(
                          width: 90.w,
                          child: const CategoryHeader(
                            title: 'Upload Date',
                            imagePath: Images.iconFilter,
                          ),
                        ).center,
                        SizedBox(
                          width: 90.w,
                          child: const CategoryHeader(
                            title: 'Status',
                            imagePath: Images.iconFilter,
                          ).center,
                        ),
                        SizedBox(
                          width: 90.w,
                          child: const CategoryHeader(
                            title: 'Action',
                            imagePath: null,
                          ),
                        ).center,
                      ],
                    ).paddingSymmetric(horizontal: 10.w),
                    Container(
                      height: 1.webH(context),
                      color: dividerColor,
                    ).paddingSymmetric(vertical: 20.h),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                Images.moveAlt,
                                height: 30.h,
                                width: 30.w,
                              ),
                              20.width,
                              SizedBox(
                                width: 70.w,
                                child: Expanded(
                                  child: "7 Ways to drink more water".toText(
                                      fontSize: 16,
                                      maxLine: 2,
                                      fontWeight: FontWeight.w400,
                                      color: blackPrimary),
                                ),
                              ),
                              10.width,
                              SizedBox(
                                width: 60.w,
                                child: "2 851".toText(
                                    fontSize: 16,
                                    maxLine: 2,
                                    fontWeight: FontWeight.w400,
                                    color: blackPrimary),
                              ),
                              SizedBox(
                                width: 90.w,
                                child: "R1 578.00".toText(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    color: blackPrimary),
                              ),
                              SizedBox(
                                width: 90.w,
                                child: "04-Aug-19  14:08".toText(
                                    fontSize: 16,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w400,
                                    color: blackPrimary),
                              ),
                              SizedBox(
                                width: 90.w,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.h),
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
                                              radius: 5.h),
                                          10.width,
                                          "Charged".toText(
                                            textAlign: TextAlign.center,
                                            fontSize: 16,
                                            color: blackPrimary,
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: 90.w,
                                child: const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Icon(Icons.more_horiz_sharp)),
                              ),
                            ],
                          ).onPress(() {
                            Navigator.pushNamed(
                                context, RouterHelper.detailReceipeScreen);
                          });
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 1.webH(context),
                            color: dividerColor,
                          ).paddingSymmetric(vertical: 20.h);
                        },
                        itemCount: 10),
                    Container(
                      height: 75.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.h),
                        color: greyButtonColor,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              "1 ".toText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: bluePrimary),
                              "- 20 of 1 256".toText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: textGreyColor),
                            ],
                          ),
                          Row(
                            children: [
                              "Entries per page".toText(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: textGreyColor),
                              15.webWidth(context),
                              Container(
                                width: 80.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: whitePrimary,
                                  border: Border.all(color: greyButtonColor),
                                  borderRadius: BorderRadius.circular(16.h),
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
                                    "25".toText(
                                        fontSize: 16, color: bluePrimary),
                                    6.webWidth(context),
                                    CustomImage(
                                      image: Images.iconDropDown,
                                      width: 24.w,
                                      height: 24.h,
                                      iconColor: bluePrimary,
                                    ),
                                  ],
                                ).center,
                              ),
                              Container(
                                height: 33.h,
                                width: 1.h,
                                color: greyLight,
                              ).paddingSymmetric(horizontal: 15.h),
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: whitePrimary,
                                  border: Border.all(color: greyButtonColor),
                                  borderRadius: BorderRadius.circular(16.h),
                                  boxShadow: [
                                    BoxShadow(
                                      color: blueSecondary.withOpacity(0.2),
                                      offset: const Offset(0, 3),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: greyLight,
                                  size: 24.h,
                                ).center,
                              ),
                              "of 29"
                                  .toText(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: bluePrimary)
                                  .paddingSymmetric(horizontal: 15.w),
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: whitePrimary,
                                  border: Border.all(color: greyButtonColor),
                                  borderRadius: BorderRadius.circular(16.h),
                                  boxShadow: [
                                    BoxShadow(
                                      color: blueSecondary.withOpacity(0.2),
                                      offset: const Offset(0, 3),
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: bluePrimary,
                                  size: 24.h,
                                ).center,
                              ),
                            ],
                          ),
                        ],
                      ).center.paddingSymmetric(horizontal: 40.w),
                    ).paddingSymmetric(vertical: 20.h),
                  ],
                ),
              ),
            )
          ],
        ).paddingAll(18.h),
      ).paddingSymmetric(horizontal: 48.webW(context));
    });
  }
}

class CategoryHeader extends StatelessWidget {
  final String title;
  final String? imagePath;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final double iconWidth;
  final double iconHeight;

  const CategoryHeader({
    super.key,
    required this.title,
    this.imagePath,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.textColor = blackPrimary,
    this.iconWidth = 16,
    this.iconHeight = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 208.webW(context),
      child: Row(
        children: [
          title.toText(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
          const SizedBox(width: 8), // Spacing between text and image
          if (imagePath != null)
            CustomImage(
              image: imagePath!,
              width: iconWidth,
              height: iconHeight,
            )
        ],
      ),
    );
  }
}
