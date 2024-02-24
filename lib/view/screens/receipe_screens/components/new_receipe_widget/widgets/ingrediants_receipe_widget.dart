import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/model/custom_model/recipe_model.dart';
import '../../../../../../provider/recepie_provider.dart';
import '../../../../../../utils/colors.dart';
import '../../../../../../utils/images.dart';
import '../../../../../widgets/web_widgets/web_custom_button.dart';
import '../../../../../widgets/web_widgets/web_text_field.dart';
import '../../receipe_widet/receipe_widget.dart';

class IngrediantsRecepieWidget extends StatelessWidget {
  final List<IngredientTextEditor> ingredientsList;
  const IngrediantsRecepieWidget({super.key, required this.ingredientsList});

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
            "Ingredients"
                .toTextWeb(
                    context: context,
                    fontSize: 24,
                    color: blackPrimary,
                    fontWeight: FontWeight.w600)
                .paddingOnly(left: 40.webW(context)),
            30.webHeight(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 220.webW(context),
                  child: const CategoryHeader(
                    title: 'Amount / Qty',
                    imagePath: null,
                  ),
                ),
                SizedBox(
                  width: 220.webW(context),
                  child: const CategoryHeader(
                    title: 'Unit of measure',
                    imagePath: null,
                  ),
                ),
                SizedBox(
                  width: 420.webW(context),
                  child: const CategoryHeader(
                    title: 'Ingredient name',
                    imagePath: null,
                  ),
                ),
                SizedBox(
                  width: 420.webW(context),
                  child: const CategoryHeader(
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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ingredientsList[index].type == 'heading'
                          // index == 2
                          ? Row(
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Image.asset(
                                    Images.moveAlt,
                                    height: 24.webT(context),
                                    width: 24.webW(context),
                                  ),
                                ),
                                3.webScaleWidth(context),
                                WebTextField(
                                  height: 50.webT(context),
                                  width: 1236.webW(context),
                                  isLabelBold: true,
                                  radius: 8.webT(context),
                                  controller:
                                      ingredientsList[index].ingredientHeading,
                                  hintText: "Ingredient heading",
                                  textInputAction: TextInputAction.next,
                                ),
                                3.webScaleWidth(context),
                                InkWell(
                                    onTap: () {
                                      Provider.of<RecepieProvider>(context,
                                              listen: false)
                                          .removeIngredient(index);
                                    },
                                    child: const Icon(
                                        Icons.delete_outline_outlined))
                              ],
                            )
                          :
                          //  const SizedBox.shrink(),
                          // ingredientsList[index].type == 'heading'
                          // index != 2
                          // ?
                          Row(
                              children: [
                                SizedBox(
                                  width: 220.webW(context),
                                  child: Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          Images.moveAlt,
                                          height: 24.webT(context),
                                          width: 24.webW(context),
                                        ),
                                      ),
                                      3.webScaleWidth(context),
                                      WebTextField(
                                        height: 50.webT(context),
                                        width: 180.webW(context),
                                        isLabelBold: true,
                                        radius: 8.webT(context),
                                        controller: ingredientsList[index]
                                            .amountController,
                                        hintText: "2",
                                        textInputAction: TextInputAction.next,
                                      ),
                                    ],
                                  ),
                                ),
                                24.webScaleWidth(context),
                                WebTextField(
                                  height: 50.webT(context),
                                  width: 180.webW(context),
                                  isLabelBold: true,
                                  radius: 8.webT(context),
                                  controller:
                                      ingredientsList[index].unitController,
                                  hintText: "tbsp",
                                  textInputAction: TextInputAction.next,
                                ),
                                24.webScaleWidth(context),
                                WebTextField(
                                  height: 50.webT(context),
                                  width: 420.webW(context),
                                  isLabelBold: true,
                                  radius: 8.webT(context),
                                  controller:
                                      ingredientsList[index].nameController,
                                  hintText: "Olive oil",
                                  textInputAction: TextInputAction.next,
                                ),
                                24.webScaleWidth(context),
                                Row(
                                  children: [
                                    WebTextField(
                                      height: 50.webT(context),
                                      width: 370.webW(context),
                                      isLabelBold: true,
                                      radius: 8.webT(context),
                                      controller: ingredientsList[index]
                                          .notesController,
                                      hintText: "extra virgin",
                                      textInputAction: TextInputAction.next,
                                    ),
                                    3.webScaleWidth(context),
                                    InkWell(
                                        onTap: () {
                                          Provider.of<RecepieProvider>(context,
                                                  listen: false)
                                              .removeIngredient(index);
                                        },
                                        child: const Icon(
                                            Icons.delete_outline_outlined))
                                  ],
                                ),
                              ],
                            )
                      // : const SizedBox.shrink()
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1.webH(context),
                    // color: dividerColor,
                  ).paddingSymmetric(vertical: 20.webT(context));
                },
                itemCount: ingredientsList.length),
            30.webHeight(context),
            Row(
              children: [
                WebCustomButton(
                  buttonName: "Add ingredient",
                  buttonTextColor: whitePrimary,
                  onPressed: () {
                    Provider.of<RecepieProvider>(context, listen: false)
                        .addIngredient('ingredient');
                  },
                  width: 420.webT(context),
                  height: 55.webT(context),
                  radius: 15.webT(context),
                  buttonColor: babyPink,
                  borderColor: babyPink,
                ),
                45.webScaleWidth(context),
                WebCustomButton(
                  buttonName: "Add ingredient heading",
                  buttonTextColor: whitePrimary,
                  onPressed: () {
                    Provider.of<RecepieProvider>(context, listen: false)
                        .addIngredient('heading');
                  },
                  width: 420.webT(context),
                  height: 55.webT(context),
                  radius: 15.webT(context),
                  buttonColor: litePurple,
                  borderColor: litePurple,
                ),
              ],
            ),
            49.webHeight(context),
          ],
        ).paddingAll(18.webT(context)),
      );
    });
  }
}
