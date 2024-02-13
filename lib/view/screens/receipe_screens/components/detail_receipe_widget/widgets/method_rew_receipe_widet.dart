// ignore_for_file: must_be_immutable

import 'package:base_code/view/widgets/custom_text_field.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/recepie_provider.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../widgets/web_widgets/web_text_field.dart';

class MethodDetailReceipeWidget extends StatelessWidget {
  final List<TextEditingController> methods;
  bool? fromMobile;
  MethodDetailReceipeWidget({
    this.fromMobile = false,
    super.key,
    required this.methods,
  });

  // List texts = [
  //   'This is one step of the instructions',
  //   'This is one step of the instructions',
  //   'This is one step of the instructions, is one step of the instructions.',
  //   'This is one step of the instructions. This is one step of the instructions, one step of the instructions. This is one step of the instructions.',
  // ];
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
            fromMobile!
                ? "Method".toText(
                    fontSize: 16,
                    color: blackPrimary,
                    fontWeight: FontWeight.w600)
                : "Method".toTextWeb(
                    context: context,
                    fontSize: 24,
                    color: blackPrimary,
                    fontWeight: FontWeight.w600),
            20.webHeight(context),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      fromMobile!
                          ? CustomTextField(
                              height: 40.h,
                              width: 350.w,
                              radius: 5.w,
                              controller: methods[index],
                              // hintText: texts[index],
                              textInputAction: TextInputAction.next,
                            )
                          : WebTextField(
                              height: 50.webT(context),
                              width: 1210.webW(context),
                              isLabelBold: true,
                              radius: 8.webT(context),
                              controller:
                                  methods[index], // hintText: texts[index],
                              textInputAction: TextInputAction.next,
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
                itemCount: methods.length),
            50.webHeight(context),
          ],
        ).paddingAll(53.webT(context)),
      );
    });
  }
}
