import 'package:base_code/view/widgets/custom_text_field.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../data/model/custom_model/tab_item_model.dart';
import '../../../../../provider/authentication_provider.dart';
import '../../../../../provider/recepie_provider.dart';
import '../../../../../utils/images.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/web_widgets/web_custom_button.dart';
import '../../../dashboard/components/custom_drawer.dart';
import '../../components/detail_receipe_widget/widgets/method_rew_receipe_widet.dart';
import '../../components/detail_receipe_widget/widgets/receipe_notes_widget.dart';

class MobDetailReceipeScreen extends StatefulWidget {
  const MobDetailReceipeScreen({super.key});

  @override
  State<MobDetailReceipeScreen> createState() => _MobDetailReceipeScreenState();
}

class _MobDetailReceipeScreenState extends State<MobDetailReceipeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: whiteStatusBar(),
      child: SafeArea(
        child: Scaffold(
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
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "The 28 Day Diet App".toText(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: blackPrimary),
                  "ADMIN PANEL".toText(
                    fontSize: 10,
                  ),
                ],
              ),
            ),
            body: Consumer2<RecepieProvider, AuthProvider>(
              builder: (context, controller, controller2, child) {
                return SingleChildScrollView(
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
                              "Review User Recipe".toText(

                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: bluePrimary),
                              "Approve or decline recipes submitted by app users"
                                  .toText(

                                  fontSize: 12,
                                  color: textGreyColor),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.webScaleWidth(context),
                              CustomButton(
                                buttonName: "Decline",
                                onPressed: () {},
                                width: 100.w,
                                textSize: 12,
                                height: 30.h,
                                buttonColor: redPrimary,
                                borderColor: redPrimary,
                                buttonTextColor: whitePrimary,
                                radius: 5.w,
                              ),
                              5.height,
                              CustomButton(
                                buttonName: "Accept",
                                onPressed: () {},
                                buttonColor: greenPrimary,
                                borderColor: greenPrimary,
                                buttonTextColor: whitePrimary,
                                width: 100.w,
                                textSize: 12,
                                height: 30.h,
                                radius: 5.w,
                              ),
                            ],
                          )
                        ],
                      ).paddingSymmetric(vertical: 25.webT(context)),
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
                                      ? title.label.toText(

                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: purplePrimary)
                                      : title.label.toText(

                                      fontSize: 10,
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
                                        .toText(

                                        fontSize: 8,
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
                      Container(
                        decoration: BoxDecoration(
                            color: whitePrimary,
                            borderRadius: BorderRadius.circular(30.webT(context))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Recipe Details".toText(

                                fontSize: 12,
                                color: blackPrimary,
                                fontWeight: FontWeight.w600),
                            25.webHeight(context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 170.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      "Photo".toText(

                                          fontSize: 11,
                                          color: blackPrimary,
                                          fontWeight: FontWeight.w600),
                                      15.webHeight(context),
                                      Container(
                                        width: 170.w,
                                        height: 165.h,
                                        decoration: BoxDecoration(
                                            color: imagePickerColor.withOpacity(0.2),
                                            border: Border.all(
                                                color:
                                                greySecondary.withOpacity(0.2)),
                                            borderRadius: BorderRadius.circular(
                                                15.webT(context))),
                                      ).onPress(() {
                                        controller2.pickImageFromFiles();
                                      }),
                                      5.height,
                                      CustomButton(
                                        buttonName: "Full View",
                                        onPressed: () {},
                                        borderColor: androidLineColor,
                                        buttonColor: androidLineColor,
                                        width: 170.w,textSize: 12,
                                        height: 30.h,
                                        radius: 5.w,
                                      )
                                    ],
                                  ),
                                ),
                                3.width,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextField(
                                      height: 40.h,
                                      width: 170.w,
                                      label: "Recipe Title",
                                      radius: 5.w,
                                      controller: controller2.firstNameController,
                                      hintText: "Grilled Chicken Kebabs",
                                      textInputAction: TextInputAction.next,
                                    ).paddingOnly(bottom: 20.webH(context)),
                                    CustomTextField(
                                      height: 40.h,
                                      width: 170.w,
                                      label: "Author",
                                      radius: 8.webT(context),
                                      controller: controller2.lastNameController,
                                      hintText: "Poppie van Staden",
                                      textInputAction: TextInputAction.next,
                                    ).paddingOnly(bottom: 20.webH(context)),
                                  ],
                                ),
                                30.webWidth(context),

                              ],
                            ),
                            90.webScaleHeight(context),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  height: 40.h,
                                  width: 170.w,
                                  label: "Upload Date",
                                  radius: 5.w,
                                  controller: controller2.emailAddressController,
                                  hintText: "Select Date",
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.emailAddress,
                                ).paddingOnly(bottom: 20.webH(context)),
                                6.webScaleHeight(context),
                                // 15.webHeight(context),
                                "Total Likes".toText(

                                    fontSize: 10,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w600),
                                6.webScaleHeight(context),

                                CustomButton(
                                  buttonName: "4 781 Likes",
                                  onPressed: () {},
                                  height: 35.h,
                                  width: 170.w,
                                  buttonColor: Colors.transparent,
                                  borderColor: pinkPrimary,
                                  buttonTextColor: womenLineColor,
                                  radius: 5.w,
                                  textSize: 10,
                                )
                              ],
                            ),
                            90.webScaleHeight(context),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomTextField(
                                      height: 40.h,
                                      width: 170.w,
                                      label: "Primary Category",
                                      radius: 5.w,
                                      controller: controller2.emailAddressController,
                                      hintText: "Chicken & Salad/Vegetables",
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.emailAddress,
                                    ).paddingOnly(bottom: 20.webH(context)),
                                    5.width,
                                    CustomTextField(
                                      height: 40.h,
                                      width: 170.w,
                                      label: "Additional Categories",
                                      radius: 5.w,
                                      controller: controller2.emailAddressController,
                                      hintText:
                                      "Chicken & 1 Vegetable, Fish & Salad/Vegetables",
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.emailAddress,
                                    ).paddingOnly(bottom: 20.webH(context)),

                                  ],
                                ),
                                CustomTextField(
                                  height: 40.h,
                                  width: 170.w,
                                  label: "Upload Language",
                                  radius: 5.w,
                                  controller: controller2.emailAddressController,
                                  hintText: "Afrikaans",
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.emailAddress,
                                ).paddingOnly(bottom: 20.webH(context)),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(
                            horizontal: 52.webW(context), vertical: 30.h),
                      ).paddingOnly(bottom: 25.webT(context)),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 500.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              25.webHeight(context),
                              "Ingredients"
                                  .toText(

                                  fontSize: 16,
                                  color: blackPrimary,
                                  fontWeight: FontWeight.w600)
                                  .paddingOnly(left: 40.webW(context)),
                              30.webHeight(context),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: const CategoryHeaderMobile(
                                      title: 'Amount / Qty',
                                      imagePath: null,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: const CategoryHeaderMobile(
                                      title: 'Unit of measure',
                                      imagePath: null,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120.w,
                                    child: const CategoryHeaderMobile(
                                      title: 'Ingredient name',
                                      imagePath: null,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120.w,
                                    child: const CategoryHeaderMobile(
                                      title: 'Ingredient notes',
                                      imagePath: null,
                                    ),
                                  ),
                                ],
                              ).paddingOnly(left: 40.webW(context)),
                              Container(
                                height: 1.webH(context),
                                color: dividerColor,
                              ).paddingSymmetric(vertical: 20.webT(context)),
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        3.webScaleWidth(context),
                                        SizedBox(
                                          width: 100.w,
                                          child: CustomTextField(
                                            height: 40.h,
                                            width: 80.w,
                                            radius: 8.webT(context),
                                            controller: TextEditingController(),
                                            hintText: "2",
                                            textInputAction: TextInputAction.next,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100.w,
                                          child: CustomTextField(
                                            height: 40.h,
                                            width: 80.w,
                                            radius: 8.webT(context),
                                            controller: TextEditingController(),
                                            hintText: "tbsp",
                                            textInputAction: TextInputAction.next,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 120.w,
                                          child: CustomTextField(
                                            height: 40.h,
                                            width: 100.w,
                                            radius: 8.webT(context),
                                            controller: TextEditingController(),
                                            hintText: "Olive oil",
                                            textInputAction: TextInputAction.next,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 120.w,
                                          child: CustomTextField(
                                            height: 40.h,
                                            width: 100.w,
                                            radius: 8.webT(context),
                                            controller: TextEditingController(),
                                            hintText: "extra virgin",
                                            textInputAction: TextInputAction.next,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      height: 1.webH(context),
                                      // color: dividerColor,
                                    ).paddingSymmetric(vertical: 20.webT(context));
                                  },
                                  itemCount: 2),
                              30.webHeight(context),
                            ],
                          ).paddingOnly(bottom: 25.webT(context)),
                        ),
                      ),
                      25.webScaleHeight(context),
                      MethodDetailReceipeWidget(fromMobile: true),
                      25.webHeight(context),
                      ReceipeNotesWidget(fromMobile: true),
                      45.webHeight(context),
                      Row(
                        children: [
                          20.webScaleWidth(context),
                          CustomButton(
                            buttonName: "Decline",
                            onPressed: () {},
                            width: 100.w,
                            height: 35.h,
                            buttonColor: redPrimary,
                            borderColor: redPrimary,
                            buttonTextColor: whitePrimary,
                            radius: 5.w,
                            textSize: 12,
                          ),
                          30.webScaleWidth(context),
                          CustomButton(
                            buttonName: "Publish",
                            onPressed: () {},
                            buttonColor: greenPrimary,
                            borderColor: greenPrimary,
                            buttonTextColor: whitePrimary,
                            width: 100.w,
                            height: 35.h,
                            radius: 5.w,
                            textSize: 12,
                          ),
                        ],
                      ),
                      15.webHeight(context),
                    ],
                  ).paddingSymmetric(
                    horizontal: 10.w,
                  ),
                );
              },
            ),),
      ),
    );
  }
}

class CategoryHeaderMobile extends StatelessWidget {
  final String title;
  final String? imagePath;
  final int fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final double iconWidth;
  final double iconHeight;

  const CategoryHeaderMobile({
    super.key,
    required this.title,
    this.imagePath,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.textColor = blackPrimary,
    this.iconWidth = 16,
    this.iconHeight = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Row(
        children: [
          title.toText(
            fontSize: 12,
            fontWeight: fontWeight,
            color: textColor,
          ),
          const SizedBox(width: 8), // Spacing between text and image
          if (imagePath != null)
            CustomImage(
              image: imagePath!,
              width: iconWidth,
              height: iconHeight,
            )
        ],
      ),
    );
  }
}
