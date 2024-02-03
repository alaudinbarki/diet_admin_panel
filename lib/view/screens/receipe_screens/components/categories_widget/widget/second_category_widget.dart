import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/recepie_provider.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../../utils/images.dart';
import '../../../../../widgets/custom_image.dart';
import '../../../../../widgets/web_widgets/web_text_field.dart';
import '../../receipe_widet/receipe_widget.dart';

class SecondCategroyWidget extends StatelessWidget {
  const SecondCategroyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecepieProvider>(builder: (context, controller, child) {
      return Container(
        decoration: BoxDecoration(
            color: whitePrimary,
            border: Border.all(color: borderColor, width: 1.webT(context)),
            borderRadius: BorderRadius.circular(16.webT(context))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.webHeight(context),
            "2 Eggs & Mushrooms".toTextWeb(
                context: context,
                fontSize: 24,
                color: babyPink,
                fontWeight: FontWeight.w600),
            30.webHeight(context),
            Container(
              height: 100.webT(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.webT(context)),
                color: greyButtonColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        borderRadius: BorderRadius.circular(10.webT(context)),
                        color: whitePrimary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImage(
                            image: Images.iconFilterUser,
                            width: 24.webT(context),
                            height: 24.webT(context)),
                        15.webScaleWidth(context),
                        "Filter".toTextWeb(
                            context: context, fontSize: 16, color: bluePrimary)
                      ],
                    ).center,
                  ).center,
                  Container(
                    width: 135.webT(context),
                    height: 45.webH(context),
                    decoration: BoxDecoration(
                        border: Border.all(color: greyLight),
                        borderRadius: BorderRadius.circular(10.webT(context)),
                        color: whitePrimary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImage(
                            image: Images.iconExport,
                            width: 24.webT(context),
                            height: 24.webT(context)),
                        15.webScaleWidth(context),
                        "Export".toTextWeb(
                            context: context, fontSize: 16, color: bluePrimary)
                      ],
                    ).center,
                  ).center,
                ],
              ).center.paddingSymmetric(horizontal: 40.webT(context)),
            ),
            30.webHeight(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  Images.iconDelete,
                  color: blackPrimary,
                  height: 30.webT(context),
                  width: 30.webT(context),
                ),
                const CategoryHeader(
                  title: 'Title',
                  imagePath: Images.iconFilter,
                ),
                const CategoryHeader(
                  title: 'Main Category',
                  imagePath: Images.iconFilter,
                ),
                const CategoryHeader(
                  title: 'Author',
                  imagePath: null,
                ),
                const CategoryHeader(
                  title: 'Upload Date',
                  imagePath: Images.iconFilter,
                ),
                const CategoryHeader(
                  title: 'Status',
                  imagePath: Images.iconFilter,
                ),
                const CategoryHeader(
                  title: 'Action',
                  imagePath: null,
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
                        width: 220.webT(context),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_box_outline_blank,
                              color: greyLight,
                            ),
                            10.webScaleWidth(context),
                            Expanded(
                              child: "Chicken Salad with Mayonnaise Dressing"
                                  .toTextWeb(
                                      context: context,
                                      fontSize: 16,
                                      maxLine: 2,
                                      fontWeight: FontWeight.w400,
                                      color: blackPrimary),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 220.webW(context),
                        child: "Chicken & Salad/Vegetables".toTextWeb(
                            context: context,
                            fontSize: 16,
                            maxLine: 2,
                            fontWeight: FontWeight.w400,
                            color: blackPrimary),
                      ),
                      SizedBox(
                        width: 208.webW(context),
                        child: "Admin".toTextWeb(
                            context: context,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                            color: blackPrimary),
                      ),
                      SizedBox(
                        width: 208.webW(context),
                        child: "04-Aug-19  14:08".toTextWeb(
                            context: context,
                            fontSize: 16,
                            textAlign: TextAlign.end,
                            fontWeight: FontWeight.w400,
                            color: blackPrimary),
                      ),
                      SizedBox(
                        width: 220.webW(context),
                        child: Align(
                          alignment: Alignment.bottomRight,
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
                                    textAlign: TextAlign.center,
                                    context: context,
                                    fontSize: 16,
                                    color: blackPrimary,
                                  ),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 208.webW(context),
                        child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.more_horiz_sharp)),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 10.webT(context));
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1.webH(context),
                    color: dividerColor,
                  ).paddingSymmetric(vertical: 20.webT(context));
                },
                itemCount: 10),
            Container(
              height: 75.webT(context),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                      ).paddingSymmetric(horizontal: 15.webT(context)),
                      Container(
                        width: 40.webT(context),
                        height: 40.webT(context),
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
                          .paddingSymmetric(horizontal: 15.webT(context)),
                      Container(
                        width: 40.webT(context),
                        height: 40.webT(context),
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
                        child: Icon(
                          Icons.arrow_forward,
                          color: bluePrimary,
                          size: 24.webT(context),
                        ).center,
                      ),
                    ],
                  ),
                ],
              ).center.paddingSymmetric(horizontal: 40.webT(context)),
            ).paddingSymmetric(vertical: 20.webT(context)),
          ],
        ).paddingAll(18.webT(context)),
      );
    });
  }
}
