import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/widgets/custom_text_field.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/model/custom_model/tab_item_model.dart';
import '../../../../../provider/recepie_provider.dart';
import '../../../../../utils/images.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_image.dart';
import '../../../dashboard/components/custom_drawer.dart';
import '../../../dashboard/components/custom_popup_menu.dart';
import '../../categories/dashbord/widgets/category_mobile_widget.dart';

class MobMeasurementScreen extends StatefulWidget {
  const MobMeasurementScreen({super.key});

  @override
  State<MobMeasurementScreen> createState() => _MobMeasurementScreenState();
}

class _MobMeasurementScreenState extends State<MobMeasurementScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
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
        actions: const [],
      ),
      body: Consumer2<RecepieProvider, AuthProvider>(
        builder: (context, controller, controller2, child) {
          return SingleChildScrollView(
            child: Container(
              color: backgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 120.h,
                    decoration: BoxDecoration(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomImage(
                              image: Images.iconProfileImage,
                              width: 50.w,
                              height: 50.h,
                            ),
                            10.width,
                            "Marci Fumons"
                                .toText(fontSize: 16, color: blackPrimary),
                            CustomPopupMenuButton()
                          ],
                        )
                      ],
                    ),
                  ),
                  38.height,
                  Container(
                    decoration: BoxDecoration(
                      color: whitePrimary,
                      border: Border.all(
                        color: borderColor,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(16.h),
                    ),
                    height: 115.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: controller.selectedLanguagesList
                          .asMap()
                          .entries
                          .map((entry) {
                        int idx = entry.key;
                        TabItem title = entry.value;
                        bool isSelected =
                            controller.selectedAddNewLanguage == idx;
                        return InkWell(
                          onTap: () {
                            controller.selectedAddNewLanguage = idx;
                            controller.notifer();
                          },
                          child: Row(
                            children: [
                              isSelected
                                  ? title.label.toText(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: purplePrimary)
                                  : title.label.toText(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: greyDark),
                              10.width,
                              title.count.isNotEmpty
                                  ? Container(
                                      decoration: isSelected
                                          ? BoxDecoration(
                                              color:
                                                  purplePrimary, // Selected tab background color
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            )
                                          : BoxDecoration(
                                              color:
                                                  blueSecondary, // Selected tab background color
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                      child: title.count
                                          .toText(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: whitePrimary)
                                          .paddingSymmetric(
                                              vertical: 3.h, horizontal: 4.w),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ).paddingOnly(right: 15.h),
                        );
                      }).toList(),
                    ).paddingSymmetric(horizontal: 52.h),
                  ).paddingOnly(left: 46.w, right: 46.w, bottom: 23.h),
                  Container(
                    decoration: BoxDecoration(
                        color: whitePrimary,
                        border: Border.all(color: borderColor, width: 1.w),
                        borderRadius: BorderRadius.circular(16.h)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        25.height,
                        "Add New Unit".toText(
                            fontSize: 16,
                            color: blackPrimary,
                            fontWeight: FontWeight.w600),
                        30.height,
                        Container(
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.h),
                            color: greyButtonColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextField(
                                controller: TextEditingController(),
                                width: 120.w,
                                height: 58.h,
                                hintText: "Afrikaans name",
                              ),
                              CustomTextField(
                                controller: TextEditingController(),
                                width: 120.w,
                                height: 58.h,
                                hintText: "English name",
                              ),
                            ],
                          ).center.paddingSymmetric(horizontal: 40.h),
                        ),
                        20.height,
                        CustomButton(
                            width: 119.w,
                            height: 53.h,
                            radius: 12.h,
                            buttonTextColor: whitePrimary,
                            borderColor: greenPrimary,
                            buttonColor: greenPrimary,
                            buttonName: "Add",
                            onPressed: () {}),
                        30.height,
                      ],
                    ).paddingAll(18.webT(context)),
                  ).paddingSymmetric(horizontal: 46.w),
                  32.height,
                  const CategoriesMobReceipeWidget()
                      .paddingSymmetric(horizontal: 46.w),
                  32.height,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
