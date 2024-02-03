import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/recepie_provider.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../../utils/images.dart';
import '../../../../../widgets/web_widgets/web_custom_button.dart';
import '../../../../../widgets/web_widgets/web_text_field.dart';

class MethodNewReceipeWidget extends StatelessWidget {
  const MethodNewReceipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecepieProvider>(builder: (context, controller, child) {
      return 
      Container(
        decoration: BoxDecoration(
            color: whitePrimary,
            border: Border.all(color: borderColor, width: 1.webT(context)),
            borderRadius: BorderRadius.circular(16.webT(context))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.webHeight(context),
            "Method"
                .toTextWeb(
                    context: context,
                    fontSize: 24,
                    color: blackPrimary,
                    fontWeight: FontWeight.w600)
                .paddingOnly(left: 40.webW(context)),
            20.webHeight(context),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              Images.moveAlt,
                              height: 24.webT(context),
                              width: 24.webW(context),
                            ),
                          ),
                          3.webScaleWidth(context),
                          WebTextField(
                            height: 50.webT(context),
                            width: 1210.webW(context),
                            isLabelBold: true,
                            radius: 8.webT(context),
                            controller: TextEditingController(),
                            hintText: "Ingredient heading",
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1.webH(context),
                    // color: dividerColor,
                  ).paddingSymmetric(vertical: 20.webT(context));
                },
                itemCount: 3),
            30.webHeight(context),
            Row(
              children: [
                WebCustomButton(
                  buttonName: "Add ingredient",
                  buttonTextColor: whitePrimary,
                  onPressed: () {},
                  width: 420.webT(context),
                  height: 55.webT(context),
                  radius: 15.webT(context),
                  buttonColor: babyPink,
                  borderColor: babyPink,
                ),
                45.webScaleWidth(context),
                WebCustomButton(
                  buttonName: "Add ingredient heading",
                  buttonTextColor: whitePrimary,
                  onPressed: () {},
                  width: 420.webT(context),
                  height: 55.webT(context),
                  radius: 15.webT(context),
                  buttonColor: litePurple,
                  borderColor: litePurple,
                ),
              ],
            ),
            40.webHeight(context),
          ],
        ).paddingAll(18.webT(context)),
      );
   
    });
  }
}
