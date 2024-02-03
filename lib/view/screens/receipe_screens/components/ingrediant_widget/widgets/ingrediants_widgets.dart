import 'package:base_code/helper/routes_helper.dart';
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

class IngrediantsWidget extends StatelessWidget {
  const IngrediantsWidget({
    super.key,
  });

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
            'Ingredients'.toTextWeb(
                context: context,
                fontSize: 24,
                color: blackPrimary,
                fontWeight: FontWeight.w600),
            30.webHeight(context),
            Container(
              height: 100.webT(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.webT(context)),
                color: greyButtonColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 313.webT(context),
                    height: 58.webT(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.webT(context)),
                        color: whitePrimary,
                        border: Border.all(color: darkPurple)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.ingrediantsIcon,
                          color: darkPurple,
                          height: 22.webT(context),
                          width: 22.webT(context),
                        ),
                        15.webScaleWidth(context),
                        "Merge Ingredients".toTextWeb(
                            context: context,
                            fontSize: 16,
                            maxLine: 2,
                            fontWeight: FontWeight.w500,
                            color: purplePrimary),
                      ],
                    ),
                  ),
                  WebTextField(
                    controller: TextEditingController(),
                    width: 970.webT(context),
                    height: 58.webT(context),
                    prefixIcon: CustomImage(
                      image: Images.iconSearch,
                      width: 20.webT(context),
                      height: 22.webT(context),
                      iconColor: bluePrimary,
                    ).paddingAll(20.webT(context)),
                    hintText: "Search",
                  ),
                ],
              ),
            ).paddingSymmetric(horizontal: 20),
            30.webHeight(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 250.webT(context),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_box_outline_blank_outlined,
                        color: greyLight,
                      ),
                      10.webScaleWidth(context),
                      Expanded(
                        child: "Ingredient name - Single".toTextWeb(
                            context: context,
                            fontSize: 16,
                            maxLine: 2,
                            fontWeight: FontWeight.w400,
                            color: greyLight),
                      ),
                    ],
                  ),
                ),
                200.webScaleWidth(context),
                SizedBox(
                  width: 220.webW(context),
                  child: "Ingredient name - Plural".toTextWeb(
                      context: context,
                      fontSize: 16,
                      maxLine: 2,
                      fontWeight: FontWeight.w400,
                      color: greyLight),
                ),
                SizedBox(
                  width: 208.webW(context),
                  child: "Count".toTextWeb(
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      color: greyLight),
                ),
                SizedBox(
                  child: "View"
                      .toTextWeb(
                          context: context,
                          fontSize: 16,
                          textAlign: TextAlign.end,
                          fontWeight: FontWeight.w500,
                          color: greyLight)
                      .paddingSymmetric(horizontal: 20, vertical: 8),
                ),
                SizedBox(
                  width: 208.webW(context),
                  child: "Actions"
                      .toTextWeb(
                          context: context,
                          fontSize: 16,
                          textAlign: TextAlign.end,
                          fontWeight: FontWeight.w500,
                          color: greyLight)
                      .paddingSymmetric(horizontal: 20, vertical: 8),
                ),
              ],
            ).paddingSymmetric(horizontal: 20.webT(context)),
            30.webHeight(context),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 250.webT(context),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_box_outline_blank_outlined,
                              color: greyLight,
                            ),
                            10.webScaleWidth(context),
                            Expanded(
                              child: "Chicken & Salad/Vegetables".toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  maxLine: 2,
                                  fontWeight: FontWeight.w400,
                                  color: blackPrimary),
                            ),
                          ],
                        ),
                      ),
                      200.webScaleWidth(context),
                      SizedBox(
                        width: 220.webW(context),
                        child: "27-Jan-2023".toTextWeb(
                            context: context,
                            fontSize: 16,
                            maxLine: 2,
                            fontWeight: FontWeight.w400,
                            color: blackPrimary),
                      ),
                      SizedBox(
                        width: 208.webW(context),
                        child: "24".toTextWeb(
                            context: context,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                            color: blackPrimary),
                      ),
                      SizedBox(
                        child: Container(
                          decoration: BoxDecoration(
                              color: whitePrimary,
                              borderRadius:
                                  BorderRadius.circular(15.webT(context)),
                              border: Border.all(
                                color: redPrimary, // Color of the border
                                width: 1, // Width of the border
                              )),
                          child: "View"
                              .toTextWeb(
                                  context: context,
                                  fontSize: 16,
                                  textAlign: TextAlign.end,
                                  fontWeight: FontWeight.w500,
                                  color: redPrimary)
                              .paddingSymmetric(horizontal: 20, vertical: 8),
                        ),
                      ),
                      SizedBox(
                        width: 208.webW(context),
                        child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.more_horiz_sharp)),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 20.webT(context)).onPress(() {
                    Navigator.pushNamed(
                        context, RouterHelper.ingrediantsDetailScreen);
                  });
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1.webH(context),
                    color: dividerColor,
                  ).paddingSymmetric(vertical: 20.webT(context));
                },
                itemCount: 4),
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
            30.webHeight(context),
          ],
        ).paddingAll(18.webT(context)),
      );
    });
  }
}
