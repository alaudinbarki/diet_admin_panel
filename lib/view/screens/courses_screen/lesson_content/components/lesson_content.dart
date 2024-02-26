import 'package:base_code/data/model/custom_model/course_model.dart';
import 'package:base_code/provider/courses_provider.dart';
// import 'package:base_code/provider/recepie_provider.dart';
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
    return Consumer<CoursesProvider>(builder: (context, controller, child) {
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
                          context: context,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: bluePrimary),
                      20.webScaleWidth(context),
                      WebCustomButton(
                        buttonName: "Update",
                        onPressed: () {
                          controller.addLession(context);
                        },
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
                          controller: controller.lessionTitle,
                          width: double.infinity,
                          label: 'Course Title',
                          hintText: "Healthy Tips for Eating Well",
                          height: 57.webT(context),
                        ),
                        SizedBox(
                          height: 36.webH(context),
                        ),
                        Container(
                          height: 57.webH(context),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(15.webT(context)),
                              border: Border.all(
                                color: greyLight, // Color of the border
                                width: 1, // Width of the border
                              )),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Module>(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.webT(context)),
                              value: controller.selectedModule,
                              icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined),
                              elevation: 16,
                              style: const TextStyle(
                                fontSize: 16,
                                color: blackPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                              hint: const Text('Choose module',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                              onChanged: (newValue) {
                                controller.selectedModule = newValue!;
                                controller.notifier();
                              },
                              items: controller.moduleList
                                  .map<DropdownMenuItem<Module>>((value) {
                                return DropdownMenuItem<Module>(
                                  value: value,
                                  child: value.moduleName.toTextWeb(
                                      context: context,
                                      fontSize: 16,
                                      color: blackPrimary,
                                      fontWeight: FontWeight.w500),
                                );
                              }).toList(),
                              // Adding the rounded border by wrapping the DropdownButton with DecoratedBox
                              dropdownColor: Colors.white,
                            ),
                          ),
                        ),
                        // WebTextField(
                        //   controller: TextEditingController(),
                        //   width: double.infinity,
                        //   label: 'Module',
                        //   height: 57.webT(context),
                        //   suffixIcon:
                        //       const Icon(Icons.keyboard_arrow_down_sharp),
                        //   hintText: "Module",
                        // ),
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
                    MediaContainer(isPhone: false),
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
                    MyHtmlEditor(
                      controller: controller.lessionDescription,
                    ),
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
