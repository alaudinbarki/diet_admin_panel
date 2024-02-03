import 'package:base_code/provider/recepie_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/screens/courses_screen/lesson_content/components/widgets.dart/html_editor.dart';
import 'package:base_code/view/screens/courses_screen/lesson_content/components/widgets.dart/media_widget.dart';
import 'package:base_code/view/widgets/custom_text_field.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/web_widgets/web_custom_button.dart';
import '../../../dashboard/components/custom_drawer.dart';

class MobileCoursesDashbord extends StatefulWidget {
  const MobileCoursesDashbord({
    super.key,
  });
  @override
  State<MobileCoursesDashbord> createState() => _MobileCoursesDashbordState();
}

class _MobileCoursesDashbordState extends State<MobileCoursesDashbord> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<RecepieProvider>(builder: (context, controller, child) {
      return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: true,
        backgroundColor: whitePrimary,
        drawer: CustomDrawer(
          fromMobile: true,
        ),
        appBar: AppBar(
          // toolbarHeight: 50.h,
          backgroundColor: whitePrimary,
          leading: Icon(
            Icons.menu,
            color: bluePrimary,
            size: 20.w,
          ).onPress(() {
            scaffoldKey.currentState!.openDrawer();
          }),
        ),
        body: Container(
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
                        "Lesson Content".toText(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        "Create or edit lesson"
                            .toText(fontSize: 12, color: textGreyColor),
                      ],
                    ),
                    Row(
                      children: [
                        "Save to drafts".toText(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: bluePrimary),
                        20.width,
                        WebCustomButton(
                          buttonName: "Update",
                          onPressed: () {},
                          width: 86.w,
                          height: 40.h,
                          radius: 15.h,
                        ),
                      ],
                    )
                  ],
                ).paddingSymmetric(vertical: 25.h, horizontal: 20.w),
                50.height,
                Container(
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      border: Border.all(color: borderColor, width: 1.w),
                      borderRadius: BorderRadius.circular(16.h)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      25.height,
                      'Lesson Details'.toText(
                          fontSize: 17,
                          color: blackPrimary,
                          fontWeight: FontWeight.w600),
                      25.height,
                      Column(
                        children: [
                          CustomTextField(
                            controller: TextEditingController(),
                            width: double.infinity,
                            label: 'Course Title',
                            hintText: "Search",
                            height: 40.h,
                            radius: 8.h,
                          ),
                          SizedBox(
                            height: 36.h,
                          ),
                          CustomTextField(
                            controller: TextEditingController(),
                            width: double.infinity,
                            label: 'Module',
                            height: 40.h,
                            radius: 8.h,
                            suffixIcon:
                                const Icon(Icons.keyboard_arrow_down_sharp),
                            hintText: "Module",
                          ),
                        ],
                      ),
                      30.height,
                    ],
                  ).paddingAll(18.h),
                ).paddingSymmetric(horizontal: 10.w),
                50.height,
                Container(
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      border: Border.all(color: borderColor, width: 1.w),
                      borderRadius: BorderRadius.circular(16.h)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      25.webHeight(context),
                      'Media'.toText(
                          fontSize: 17,
                          color: blackPrimary,
                          fontWeight: FontWeight.w600),
                      40.height,
                      MediaContainer(
                        isPhone: true,
                      ),
                    ],
                  ).paddingAll(18.webT(context)),
                ).paddingSymmetric(horizontal: 48.webW(context)),
                50.webHeight(context),
                Container(
                  decoration: BoxDecoration(
                      color: whitePrimary,
                      border: Border.all(
                          color: borderColor, width: 1.webT(context)),
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
        ),
      );
    });
  }
}
