import 'package:base_code/provider/recepie_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/screens/courses_screen/lesson_content/components/widgets.dart/html_editor.dart';
import 'package:base_code/view/screens/courses_screen/lesson_content/components/widgets.dart/media_widget.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/web_widgets/web_custom_button.dart';

class LessonContentWidget extends StatefulWidget {
  const LessonContentWidget({
    super.key,
  });
  @override
  State<LessonContentWidget> createState() => _LessonContentWidgetState();
}

class _LessonContentWidgetState extends State<LessonContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecepieProvider>(builder: (context, controller, child) {
      return Container(
        height: 1294.webH(context),
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Lesson Content".toTextWeb(
                          context: context,
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                          color: bluePrimary),
                      "Create or edit lesson".toTextWeb(
                          context: context, fontSize: 16, color: textGreyColor),
                    ],
                  ),
                  Row(
                    children: [
                      "Save to drafts".toTextWeb(
                          context: context, fontSize: 18, fontWeight: FontWeight.w600, color: bluePrimary),
                      20.webScaleWidth(context),
                      WebCustomButton(
                        buttonName: "Update",
                        onPressed: () {},
                        width: 206.webT(context),
                        height: 45.webT(context),
                        radius: 15.webT(context),
                      ),
                    ],
                  )
                ],
              ).paddingSymmetric(
                  vertical: 25.webT(context), horizontal: 45.webW(context)),
              50.webHeight(context),
              Container(
                decoration: BoxDecoration(
                    color: whitePrimary,
                    border:
                        Border.all(color: borderColor, width: 1.webT(context)),
                    borderRadius: BorderRadius.circular(16.webT(context))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    25.webHeight(context),
                    'Lesson Details'.toTextWeb(
                        context: context,
                        fontSize: 24,
                        color: blackPrimary,
                        fontWeight: FontWeight.w600),
                    30.webHeight(context),
                    Column(
                      children: [
                        WebTextField(
                          controller: TextEditingController(),
                          width: double.infinity,
                          label: 'Course Title',
                          hintText: "Search",
                          height: 57.webT(context),
                        ),
                        SizedBox(
                          height: 36.webH(context),
                        ),
                        WebTextField(
                          controller: TextEditingController(),
                          width: double.infinity,
                          label: 'Module',
                          height: 57.webT(context),
                          suffixIcon:
                              const Icon(Icons.keyboard_arrow_down_sharp),
                          hintText: "Module",
                        ),
                      ],
                    ),
                    30.webHeight(context),
                  ],
                ).paddingAll(18.webT(context)),
              ).paddingSymmetric(horizontal: 48.webW(context)),
              50.webHeight(context),
              Container(
                decoration: BoxDecoration(
                    color: whitePrimary,
                    border:
                        Border.all(color: borderColor, width: 1.webT(context)),
                    borderRadius: BorderRadius.circular(16.webT(context))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    25.webHeight(context),
                    'Media'.toTextWeb(
                        context: context,
                        fontSize: 24,
                        color: blackPrimary,
                        fontWeight: FontWeight.w600),
                    60.webHeight(context),
                     MediaContainer(isPhone: false,),
                  ],
                ).paddingAll(18.webT(context)),
              ).paddingSymmetric(horizontal: 48.webW(context)),
              50.webHeight(context),
              Container(
                decoration: BoxDecoration(
                    color: whitePrimary,
                    border:
                        Border.all(color: borderColor, width: 1.webT(context)),
                    borderRadius: BorderRadius.circular(16.webT(context))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyHtmlEditor(),
                    25.webHeight(context),
                    'Text'.toTextWeb(
                        context: context,
                        fontSize: 24,
                        color: blackPrimary,
                        fontWeight: FontWeight.w600),
                    30.webHeight(context),
                    WebTextField(
                      controller: TextEditingController(),
                      width: double.infinity,
                      label: 'Downloads',
                      height: 57.webT(context),
                      suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
                      hintText: "Select File(s)",
                    ),
                    30.webHeight(context),
                  ],
                ).paddingAll(18.webT(context)),
              ).paddingSymmetric(horizontal: 48.webW(context)),
              20.webScaleHeight(context),
            ],
          ),
        ),
      );
    });
  }
}
