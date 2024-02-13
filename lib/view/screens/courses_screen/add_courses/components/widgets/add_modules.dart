import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../helper/routes_helper.dart';
// import '../../../../../../provider/recepie_provider.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../widgets/web_widgets/web_custom_button.dart';
import 'add_new_modules.dart';

class ModuleWidget extends StatefulWidget {
  const ModuleWidget({
    super.key,
  });

  @override
  State<ModuleWidget> createState() => _ModuleWidgetState();
}

class _ModuleWidgetState extends State<ModuleWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, controller, child) {
      return Container(
        decoration: BoxDecoration(
            color: whitePrimary,
            border: Border.all(color: borderColor, width: 1.webT(context)),
            borderRadius: BorderRadius.circular(16.webT(context))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.webHeight(context),
            'Modules'.toTextWeb(
                context: context,
                fontSize: 24,
                color: blackPrimary,
                fontWeight: FontWeight.w600),
            30.webHeight(context),
            WebCustomButton(
              buttonName: "New Lesson",
              onPressed: () {
                Navigator.pushNamed(context, RouterHelper.lessonDashbord);
              },
              borderColor: purplePrimary,
              buttonColor: purplePrimary,
              width: 206.webT(context),
              height: 50.webT(context),
              radius: 15.webT(context),
            ).align(Alignment.centerRight),
            30.webHeight(context),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 58.webT(context),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(13.webT(context)),
                            color: whitePrimary,
                            border: Border.all(color: greyLight)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Module Name to Appear Here".toTextWeb(
                                context: context,
                                fontSize: 16,
                                maxLine: 2,
                                fontWeight: FontWeight.w500,
                                color: blackPrimary),
                            Row(
                              children: [
                                Container(
                                  width: 180.webW(context),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(10.webT(context)),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: greenPrimary,
                                          radius: 5.webT(context)),
                                      10.webWidth(context),
                                      "Published".toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        color: blackPrimary,
                                      ),
                                      10.webWidth(context),
                                      const Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 14,
                                      )
                                    ],
                                  )
                                      .paddingSymmetric(
                                          horizontal: 12.webW(context),
                                          vertical: 5.webH(context))
                                      .center,
                                )
                                    .align(Alignment.centerLeft)
                                    .paddingOnly(right: 30.webW(context)),
                                const Icon(
                                  Icons.keyboard_arrow_up_rounded,
                                  color: blackPrimary,
                                ),
                              ],
                            )
                          ],
                        ).paddingAll(14.webT(context)),
                      ).onPress(() {
                        if (selectedIndex == index) {
                          selectedIndex = -1;
                        } else {
                          selectedIndex = index;
                        }
                        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                        controller.notifyListeners();
                      }),
                      if (selectedIndex == index)
                        ListView.builder(
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(Images.moveAlt),
                                    55.webScaleWidth(context),
                                    "Lesson name here".toTextWeb(
                                        context: context,
                                        fontSize: 16,
                                        maxLine: 2,
                                        fontWeight: FontWeight.w400,
                                        color: blackPrimary),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 180.webW(context),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.webT(context)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: greenPrimary,
                                              radius: 5.webT(context)),
                                          10.webWidth(context),
                                          "Published".toTextWeb(
                                            context: context,
                                            fontSize: 16,
                                            color: blackPrimary,
                                          ),
                                          10.webWidth(context),
                                          const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            size: 14,
                                          )
                                        ],
                                      )
                                          .paddingSymmetric(
                                              horizontal: 12.webW(context),
                                              vertical: 5.webH(context))
                                          .center,
                                    )
                                        .align(Alignment.centerLeft)
                                        .paddingOnly(right: 20.webW(context)),
                                    const Align(child: Icon(Icons.more_vert)),
                                  ],
                                )
                              ],
                            ).paddingOnly(
                                left: 20.webT(context),
                                right: 20.webT(context),
                                top: 25.webH(context));
                          },
                        )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1.webH(context),
                    color: dividerColor,
                  ).paddingSymmetric(vertical: 20.webT(context));
                },
                itemCount: 3),
            75.webHeight(context),
            const AddNewModule(),
            30.webScaleHeight(context),
          ],
        )
            .paddingAll(18.webT(context))
            .paddingSymmetric(horizontal: 10.webT(context)),
      ).paddingSymmetric(horizontal: 8.webT(context));
    });
  }
}
