import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/recepie_provider.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../widgets/web_widgets/web_custom_button.dart';
import '../../../../../widgets/web_widgets/web_text_field.dart';

class AddNewUnitWidget extends StatelessWidget {
  const AddNewUnitWidget({super.key});

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
            "Add New Unit".toTextWeb(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WebTextField(
                    controller: TextEditingController(),
                    width: 600.webT(context),
                    height: 58.webH(context),
                    hintText: "Afrikaans name",
                  ),
                  WebTextField(
                    controller: TextEditingController(),
                    width: 600.webT(context),
                    height: 58.webH(context),
                    hintText: "English name",
                  ),
                  WebCustomButton(
                      width: 119.webT(context),
                      height: 53.webH(context),
                      radius: 12.webT(context),
                      buttonTextColor: whitePrimary,
                      borderColor: greenPrimary,
                      buttonColor: greenPrimary,
                      buttonName: "Add",
                      onPressed: () {}),
                ],
              ).center.paddingSymmetric(horizontal: 40.webT(context)),
            ),
            30.webHeight(context),
          ],
        ).paddingAll(18.webT(context)),
      );
    });
  }
}
