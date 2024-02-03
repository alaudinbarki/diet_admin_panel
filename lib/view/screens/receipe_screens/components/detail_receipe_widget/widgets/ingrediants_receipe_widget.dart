import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/recepie_provider.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../widgets/web_widgets/web_text_field.dart';
import '../../receipe_widet/receipe_widget.dart';

class IngrediantsDetailWidget extends StatelessWidget {
  const IngrediantsDetailWidget({super.key});

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
            "Ingredients"
                .toTextWeb(
                    context: context,
                    fontSize: 24,
                    color: blackPrimary,
                    fontWeight: FontWeight.w600)
                .paddingOnly(left: 40.webW(context)),
            30.webHeight(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 220.webW(context),
                  child: const CategoryHeader(
                    title: 'Amount / Qty',
                    imagePath: null,
                  ),
                ),
                SizedBox(
                  width: 220.webW(context),
                  child: const CategoryHeader(
                    title: 'Unit of measure',
                    imagePath: null,
                  ),
                ),
                SizedBox(
                  width: 420.webW(context),
                  child: const CategoryHeader(
                    title: 'Ingredient name',
                    imagePath: null,
                  ),
                ),
                SizedBox(
                  width: 420.webW(context),
                  child: const CategoryHeader(
                    title: 'Ingredient notes',
                    imagePath: null,
                  ),
                ),
              ],
            ).paddingOnly(left: 40.webW(context)),
            Container(
              height: 1.webH(context),
              color: dividerColor,
            ).paddingSymmetric(vertical: 20.webT(context)),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      3.webScaleWidth(context),
                      WebTextField(
                        height: 50.webT(context),
                        width: 220.webW(context),
                        isLabelBold: true,
                        radius: 8.webT(context),
                        controller: TextEditingController(),
                        hintText: "2",
                        textInputAction: TextInputAction.next,
                      ),
                      WebTextField(
                        height: 50.webT(context),
                        width: 220.webW(context),
                        isLabelBold: true,
                        radius: 8.webT(context),
                        controller: TextEditingController(),
                        hintText: "tbsp",
                        textInputAction: TextInputAction.next,
                      ),
                      WebTextField(
                        height: 50.webT(context),
                        width: 420.webW(context),
                        isLabelBold: true,
                        radius: 8.webT(context),
                        controller: TextEditingController(),
                        hintText: "Olive oil",
                        textInputAction: TextInputAction.next,
                      ),
                      WebTextField(
                        height: 50.webT(context),
                        width: 420.webW(context),
                        isLabelBold: true,
                        radius: 8.webT(context),
                        controller: TextEditingController(),
                        hintText: "extra virgin",
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1.webH(context),
                    // color: dividerColor,
                  ).paddingSymmetric(vertical: 20.webT(context));
                },
                itemCount: 2),
            30.webHeight(context),
          ],
        ).paddingAll(18.webT(context)),
      );
    });
  }
}
