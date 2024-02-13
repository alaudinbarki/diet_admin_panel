// ignore_for_file: must_be_immutable

import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/recepie_provider.dart';
import '../../../../../../utils/colors.dart';

class ReceipeNotesWidget extends StatelessWidget {
  bool? fromMobile;
  ReceipeNotesWidget({this.fromMobile = false, super.key});

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
            Container(
              width: double.infinity,
              height: 143.h,
              decoration: BoxDecoration(
                  color: whitePrimary,
                  border:
                      Border.all(color: borderColor, width: 1.webT(context)),
                  borderRadius: BorderRadius.circular(16.webT(context))),
              child: fromMobile!
                  ? "Here you can find some additional notes or tips or advice for variation ideas for this recipe."
                      .toText(
                          fontSize: 12,
                          color: blackPrimary,
                          maxLine: 1000,
                          fontWeight: FontWeight.w500)
                      .paddingSymmetric(
                          horizontal: 10.webT(context),
                          vertical: 24.webT(context))
                  : "Here you can find some additional notes or tips or advice for variation ideas for this recipe."
                      .toTextWeb(
                          context: context,
                          fontSize: 16,
                          color: blackPrimary,
                          maxLine: 1000,
                          fontWeight: FontWeight.w500)
                      .paddingSymmetric(
                          horizontal: 10.webT(context),
                          vertical: 24.webT(context)),
            )
          ],
        ).paddingAll(53.webT(context)),
      );
    });
  }
}
