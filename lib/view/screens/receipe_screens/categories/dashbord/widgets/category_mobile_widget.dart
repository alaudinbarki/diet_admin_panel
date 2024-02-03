import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../helper/routes_helper.dart';
import '../../../../../../provider/recepie_provider.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/images.dart';
import '../../../../../widgets/custom_image.dart';

class CategoriesMobReceipeWidget extends StatelessWidget {
  const CategoriesMobReceipeWidget({
    super.key,
  });

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
            25.webHeight(context),
            Constant.categrories.toText(
                fontSize: 16, color: blackPrimary, fontWeight: FontWeight.w600),
            30.webHeight(context),
            Container(
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.h),
                color: greyButtonColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.h),
                        color: whitePrimary,
                        border: Border.all(color: darkPurple)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.iconDelete,
                          color: darkPurple,
                          height: 30.h,
                          width: 30.w,
                        ),
                        15.width,
                        "Bulk delete".toText(
                            fontSize: 16,
                            maxLine: 2,
                            fontWeight: FontWeight.w500,
                            color: purplePrimary),
                      ],
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        borderRadius: BorderRadius.circular(15.h),
                        border: Border.all(
                          color: greyLight, // Color of the border
                          width: 1, // Width of the border
                        )),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: controller.dropdownValue,
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        elevation: 16,
                        style: const TextStyle(
                          fontSize: 16,
                          color: blackPrimary,
                          fontWeight: FontWeight.w500,
                        ),

                        onChanged: (String? newValue) {
                          controller.dropdownValue = newValue!;
                          controller.notifer();
                        },
                        items: controller.items
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: value.toText(
                                fontSize: 14,
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
              ).center.paddingSymmetric(horizontal: 20.w),
            ),
            30.height,
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
                          width: 100.w,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_box_outline_blank_outlined,
                                color: greyLight,
                              ),
                              10.width,
                              Expanded(
                                child: "Category Title".toText(
                                    fontSize: 16,
                                    maxLine: 2,
                                    fontWeight: FontWeight.w400,
                                    color: greyLight),
                              ),
                            ],
                          ),
                        ),
                        10.width,
                        SizedBox(
                          width: 100.w,
                          child: "Date added".toText(
                              fontSize: 16,
                              maxLine: 2,
                              fontWeight: FontWeight.w400,
                              color: greyLight),
                        ),
                        SizedBox(
                          width: 100.w,
                          child: "Count".toText(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                              color: greyLight),
                        ),
                        SizedBox(
                          width: 100.w,
                          child: "View".toText(
                              fontSize: 16,
                              textAlign: TextAlign.end,
                              fontWeight: FontWeight.w500,
                              color: greyLight),
                        ),
                        SizedBox(
                          width: 100.w,
                          child: "Actions".toText(
                              fontSize: 16,
                              textAlign: TextAlign.end,
                              fontWeight: FontWeight.w500,
                              color: greyLight),
                        ),
                      ],
                    ),
                    30.height,
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 140.w,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_box_outline_blank_outlined,
                                      color: greyLight,
                                    ),
                                    10.width,
                                    Expanded(
                                      child: "Chicken & Salad/Vegetables"
                                          .toText(
                                              fontSize: 16,
                                              maxLine: 2,
                                              fontWeight: FontWeight.w400,
                                              color: blackPrimary),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 110.w,
                                child: "27-Jan-2023".toText(
                                    fontSize: 16,
                                    maxLine: 2,
                                    fontWeight: FontWeight.w400,
                                    color: blackPrimary),
                              ),
                              SizedBox(
                                width: 120.w,
                                child: "24".toText(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                    color: blackPrimary),
                              ).paddingOnly(right: 100.h),
                              SizedBox(
                                width: 80.w,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: whitePrimary,
                                      borderRadius: BorderRadius.circular(15.w),
                                      border: Border.all(
                                        color:
                                            redPrimary, // Color of the border
                                        width: 1, // Width of the border
                                      )),
                                  child: "View"
                                      .toText(
                                          fontSize: 16,
                                          textAlign: TextAlign.end,
                                          fontWeight: FontWeight.w500,
                                          color: redPrimary)
                                      .center
                                      .paddingSymmetric(
                                          horizontal: 20, vertical: 8),
                                ),
                              ),
                              SizedBox(
                                width: 80.w,
                                child: const Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(Icons.more_horiz_sharp)),
                              ),
                            ],
                          ).onPress(() {
                            Navigator.pushNamed(
                                context, RouterHelper.detailCategoryScreen);
                          });
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 1.webH(context),
                            color: dividerColor,
                          ).paddingSymmetric(vertical: 20.w);
                        },
                        itemCount: 4),
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
                              15.width,
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
                                    6.width,
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
                                height: 33.h,
                                width: 1.w,
                                color: greyLight,
                              ).paddingSymmetric(horizontal: 15.w),
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: whitePrimary,
                                  border: Border.all(color: greyButtonColor),
                                  borderRadius:
                                      BorderRadius.circular(16.webT(context)),
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
                                  size: 24.webT(context),
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
                                  size: 24.w,
                                ).center,
                              ),
                            ],
                          ).onPress(() {}),
                        ],
                      ).center.paddingSymmetric(horizontal: 20.w),
                    ).paddingSymmetric(vertical: 20.w),
                    30.width,
                  ],
                ),
              ),
            ),
          ],
        ).paddingAll(18.w),
      );
    });
  }
}
