import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/screens/receipe_screens/components/categories_widget/widget/categories_receipe_widget.dart';
import 'package:base_code/view/screens/receipe_screens/components/categories_widget/widget/second_category_widget.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/model/custom_model/tab_item_model.dart';
import '../../../../../provider/recepie_provider.dart';
import '../../../../../utils/images.dart';
import '../../../../widgets/custom_image.dart';
import '../../../dashboard/components/custom_popup_menu.dart';

class DetailCategoryWidget extends StatefulWidget {
  const DetailCategoryWidget({super.key});

  @override
  State<DetailCategoryWidget> createState() => _DetailCategoryWidgetState();
}

class _DetailCategoryWidgetState extends State<DetailCategoryWidget> {
  final int _selectedIndex = 0;
  // Track the selected index
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1294.webH(context),
      color: backgroundColor,
      child: Consumer2<RecepieProvider, AuthProvider>(
        builder: (context, controller, controller2, child) {
          return SingleChildScrollView(
            child: Container(
              color: backgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 120.webT(context),
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
                                width: 50.webT(context),
                                height: 50.webT(context)),
                            10.webWidth(context),
                            "Marci Fumons".toTextWeb(
                                context: context,
                                fontSize: 22,
                                color: blackPrimary),
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
                        width: 1.webT(context),
                      ),
                      borderRadius: BorderRadius.circular(16.webT(context)),
                    ),
                    height: 115.webT(context),
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
                                  ? title.label.toTextWeb(
                                      context: context,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: purplePrimary)
                                  : title.label.toTextWeb(
                                      context: context,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: greyDark),
                              10.webScaleWidth(context),
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
                                          .toTextWeb(
                                              context: context,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: whitePrimary)
                                          .paddingSymmetric(
                                              vertical: 3.webT(context),
                                              horizontal: 4.w),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ).paddingOnly(right: 15.webT(context)),
                        );
                      }).toList(),
                    ).paddingSymmetric(horizontal: 52.webW(context)),
                  ).paddingOnly(bottom: 23.webH(context)),
                  const CategoriesReceipeWidget(),
                  31.webScaleHeight(context),
                  const SecondCategroyWidget(),
                  20.webHeight(context)
                ],
              ).paddingSymmetric(horizontal: 48.webW(context)),
            ),
          );
        },
      ),
    );
  }
}
