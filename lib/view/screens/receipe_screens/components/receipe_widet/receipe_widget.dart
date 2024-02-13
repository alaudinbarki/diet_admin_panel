// ignore_for_file: must_be_immutable

import 'package:base_code/provider/recepie_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/date_time_format.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/screens/dashboard/components/custom_popup_menu.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:base_code/view/widgets/web_widgets/web_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/model/custom_model/recipe_model.dart';
import '../../../../../data/model/custom_model/tab_item_model.dart';
import '../../../../../helper/routes_helper.dart';
import '../../../../../utils/constant.dart';
import '../../../../widgets/web_widgets/web_custom_button.dart';

class ReceipeWidget extends StatefulWidget {
  ReceipeWidget({super.key, required this.title});
  var title;
  @override
  State<ReceipeWidget> createState() => _ReceipeWidgetState();
}

class _ReceipeWidgetState extends State<ReceipeWidget> {
  int _selectedIndex = 0; // Track the selected index
  RecepieProvider? recepieProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recepieProvider = Provider.of<RecepieProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecepieProvider>(builder: (context, controller, child) {
      return Container(
        height: 1294.webH(context),
        color: backgroundColor,
        child: recepieProvider!.isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : SingleChildScrollView(
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
                    38.webHeight(context),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.title.toString().toTextWeb(
                            context: context,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: blackPrimary),
                        29.height,
                        Container(
                          decoration: BoxDecoration(
                            color: whitePrimary,
                            border: Border.all(
                              color: borderColor,
                              width: 1.webT(context),
                            ),
                            borderRadius:
                                BorderRadius.circular(16.webT(context)),
                          ),
                          height: 115.webT(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:
                                controller.tabs.asMap().entries.map((entry) {
                              int idx = entry.key;
                              TabItem title = entry.value;
                              bool isSelected = _selectedIndex == idx;
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = idx;
                                  });
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
                                    Container(
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
                                    ),
                                  ],
                                ).paddingOnly(
                                    left: 15.webT(context),
                                    right: 15.webT(context)),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 48.webT(context)),
                    50.webHeight(context),
                    AllRecepies(recipe: recepieProvider!.recipeList),
                    20.webHeight(context),
                  ],
                ),
              ),
      );
    });
  }

  renderingDetailBox(
      BuildContext context,
      String title,
      String titleNumber,
      String titleIcon,
      String arrowIcon,
      String titlePercentage,
      String titleDescription) {
    return SizedBox(
      width: 280.webW(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleNumber.toTextWeb(
                  context: context,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: blackPrimary),
              Container(
                width: 60.webT(context),
                height: 60.webT(context),
                decoration: BoxDecoration(
                  color: whitePrimary,
                  borderRadius: BorderRadius.circular(16.webT(context)),
                  boxShadow: [
                    BoxShadow(
                      color: blueSecondary.withOpacity(0.2),
                      offset: const Offset(0, 3),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: CustomImage(
                  image: titleIcon,
                  width: 25.webT(context),
                  height: 25.webT(context),
                ).center,
              ),
            ],
          ),
          title.toTextWeb(context: context, fontSize: 22, color: blackPrimary),
          15.webHeight(context),
          Row(
            children: [
              CustomImage(
                image: arrowIcon,
                width: 25.webT(context),
                height: 25.webT(context),
              ),
              10.webWidth(context),
              titlePercentage.toTextWeb(context: context, fontSize: 18),
              15.webWidth(context),
              titleDescription.toTextWeb(context: context, fontSize: 18),
            ],
          )
        ],
      ),
    );
  }
}

class AllRecepies extends StatelessWidget {
  final List<RecipeModel> recipe;
  AllRecepies({super.key, required this.recipe});
  List<bool> selectedRecipes = [];

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Constant.allRecipe.toTextWeb(
                    context: context,
                    fontSize: 24,
                    color: blackPrimary,
                    fontWeight: FontWeight.w600),
                WebCustomButton(
                  buttonName: "Import Recipes",
                  textSize: 13,
                  prefixIcon: Image.asset(Images.addIcon),
                  onPressed: () {},
                  width: 200.webW(context),
                  height: 45.webT(context),
                  radius: 15.webT(context),
                ),
              ],
            ),
            30.webHeight(context),
            Container(
              height: 100.webT(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.webT(context)),
                color: greyButtonColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WebTextField(
                    controller: TextEditingController(),
                    width: 700.webT(context),
                    prefixIcon: CustomImage(
                      image: Images.iconSearch,
                      width: 20.webT(context),
                      height: 20.webT(context),
                      iconColor: bluePrimary,
                    ).paddingAll(20.webT(context)),
                    hintText: "Search",
                  ),
                  WebTextField(
                    controller: TextEditingController(),
                    width: 120.webT(context),
                    hintText: "From Date",
                  ),
                  WebTextField(
                    controller: TextEditingController(),
                    width: 120.webT(context),
                    hintText: "From Date",
                  ),
                  Container(
                    width: 135.webT(context),
                    height: 45.webH(context),
                    decoration: BoxDecoration(
                        border: Border.all(color: greyLight),
                        borderRadius: BorderRadius.circular(10.webT(context)),
                        color: whitePrimary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImage(
                            image: Images.iconFilterUser,
                            width: 24.webT(context),
                            height: 24.webT(context)),
                        15.webScaleWidth(context),
                        "Filter".toTextWeb(
                            context: context, fontSize: 16, color: bluePrimary)
                      ],
                    ).center,
                  ).center,
                  Container(
                    width: 135.webT(context),
                    height: 45.webH(context),
                    decoration: BoxDecoration(
                        border: Border.all(color: greyLight),
                        borderRadius: BorderRadius.circular(10.webT(context)),
                        color: whitePrimary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImage(
                            image: Images.iconExport,
                            width: 24.webT(context),
                            height: 24.webT(context)),
                        15.webScaleWidth(context),
                        "Export".toTextWeb(
                            context: context, fontSize: 16, color: bluePrimary)
                      ],
                    ).center,
                  ).center,
                ],
              ).center.paddingSymmetric(horizontal: 40.webT(context)),
            ),
            30.webHeight(context),
            CustomPagination(recipe: recipe)
          ],
        ).paddingAll(18.webT(context)),
      ).paddingSymmetric(horizontal: 48.webW(context));
    });
  }
}

class CustomPagination extends StatefulWidget {
  final List<RecipeModel> recipe;

  const CustomPagination({super.key, required this.recipe});
  @override
  State<CustomPagination> createState() => _CustomPaginationState();
}

class _CustomPaginationState extends State<CustomPagination> {
  int totalEntries = 0; // Total number of entries
  final int entriesPerPage = 25; // Number of entries per page
  int currentPage = 0;

  List<String> entries = List.generate(
      100,
      (index) =>
          'Entry ${index + 1}'); // Replace this with your actual data source

  List<String> getEntriesForPage(int page) {
    int startIndex = page * entriesPerPage;
    int endIndex = startIndex + entriesPerPage;
    return entries.sublist(
        startIndex, endIndex > entries.length ? entries.length : endIndex);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalEntries = widget.recipe.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryHeader(
              title: 'Title',
              imagePath: Images.iconFilter,
            ),
            CategoryHeader(
              title: 'Main Category',
              imagePath: Images.iconFilter,
            ),
            CategoryHeader(
              title: 'Author',
              imagePath: null,
            ),
            CategoryHeader(
              title: 'Upload Date',
              imagePath: Images.iconFilter,
            ),
            CategoryHeader(
              title: 'Status',
              imagePath: Images.iconFilter,
            ),
            CategoryHeader(
              title: 'Action',
              imagePath: null,
            ),
          ],
        ),
        Container(
          height: 1.webH(context),
          color: dividerColor,
        ).paddingSymmetric(vertical: 20.webT(context)),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              RecipeModel singleRecipe = widget.recipe[index];

              return Row(
                children: [
                  SizedBox(
                    width: 220.webT(context),
                    child: Row(
                      children: [
                        const Icon(Icons.check_box),
                        10.webScaleWidth(context),
                        Expanded(
                          child: singleRecipe.title.toTextWeb(
                              context: context,
                              fontSize: 16,
                              maxLine: 2,
                              fontWeight: FontWeight.w400,
                              color: blackPrimary),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 220.webW(context),
                    child: singleRecipe.categoryList.first.toTextWeb(
                        context: context,
                        fontSize: 16,
                        maxLine: 2,
                        fontWeight: FontWeight.w400,
                        color: blackPrimary),
                  ),
                  SizedBox(
                    width: 208.webW(context),
                    child: "Admin".toTextWeb(
                        context: context,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        color: blackPrimary),
                  ),
                  SizedBox(
                    width: 208.webW(context),
                    // child: "04-Aug-19  14:08".toTextWeb(
                    child: formatDate(singleRecipe.updateDate).toTextWeb(
                        context: context,
                        fontSize: 16,
                        textAlign: TextAlign.end,
                        fontWeight: FontWeight.w400,
                        color: blackPrimary),
                  ),
                  SizedBox(
                    width: 220.webW(context),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          width: 125.webW(context),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  backgroundColor: index % 2 == 0
                                      ? redPrimary
                                      : greenPrimary,
                                  radius: 5.webT(context)),
                              10.webWidth(context),
                              "Charged".toTextWeb(
                                textAlign: TextAlign.center,
                                context: context,
                                fontSize: 16,
                                color: blackPrimary,
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 208.webW(context),
                    child: const Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.more_horiz_sharp)),
                  ),
                ],
              ).onPress(() {
                Navigator.pushNamed(
                  context, RouterHelper.detailReceipeScreen,
                  // arguments: widget.recipe[index]
                );
                Provider.of<RecepieProvider>(context, listen: false)
                    .updateTextEditor(widget.recipe[index]);
              });
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 1.webH(context),
                color: dividerColor,
              ).paddingSymmetric(vertical: 20.webT(context));
            },
            itemCount: widget.recipe.length),
        Container(
          height: 75.webT(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.webT(context)),
            color: greyButtonColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  "1 ".toTextWeb(
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: bluePrimary),
                  "- 20 of $currentPage $totalEntries".toTextWeb(
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textGreyColor),
                ],
              ),
              Row(
                children: [
                  "Entries per page".toTextWeb(
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textGreyColor),
                  15.webWidth(context),
                  Container(
                    width: 80.webT(context),
                    height: 40.webT(context),
                    decoration: BoxDecoration(
                      color: whitePrimary,
                      border: Border.all(color: greyButtonColor),
                      borderRadius: BorderRadius.circular(16.webT(context)),
                      boxShadow: [
                        BoxShadow(
                          color: blueSecondary.withOpacity(0.2),
                          offset: const Offset(0, 3),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        "25".toTextWeb(
                            context: context, fontSize: 16, color: bluePrimary),
                        6.webWidth(context),
                        CustomImage(
                          image: Images.iconDropDown,
                          width: 24.webT(context),
                          height: 24.webT(context),
                          iconColor: bluePrimary,
                        ),
                      ],
                    ).center,
                  ),
                  Container(
                    height: 33.webT(context),
                    width: 1.webT(context),
                    color: greyLight,
                  ).paddingSymmetric(horizontal: 15.webT(context)),
                  GestureDetector(
                    onTap: currentPage > 0
                        ? () => setState(() => currentPage--)
                        : null,
                    child: Container(
                      width: 40.webT(context),
                      height: 40.webT(context),
                      decoration: BoxDecoration(
                        color: whitePrimary,
                        border: Border.all(color: greyButtonColor),
                        borderRadius: BorderRadius.circular(16.webT(context)),
                        boxShadow: [
                          BoxShadow(
                            color: blueSecondary.withOpacity(0.2),
                            offset: const Offset(0, 3),
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: greyLight,
                        size: 24.webT(context),
                      ).center,
                    ),
                  ),
                  "of 29"
                      .toTextWeb(
                          context: context,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: bluePrimary)
                      .paddingSymmetric(horizontal: 15.webT(context)),
                  GestureDetector(
                    onTap: currentPage < (totalEntries ~/ entriesPerPage)
                        ? () => setState(() => currentPage++)
                        : null,
                    child: Container(
                      width: 40.webT(context),
                      height: 40.webT(context),
                      decoration: BoxDecoration(
                        color: whitePrimary,
                        border: Border.all(color: greyButtonColor),
                        borderRadius: BorderRadius.circular(16.webT(context)),
                        boxShadow: [
                          BoxShadow(
                            color: blueSecondary.withOpacity(0.2),
                            offset: const Offset(0, 3),
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: bluePrimary,
                        size: 24.webT(context),
                      ).center,
                    ),
                  ),
                ],
              ),
            ],
          ).center.paddingSymmetric(horizontal: 40.webT(context)),
        ).paddingSymmetric(vertical: 20.webT(context)),
      ],
    );
  }
}

class CategoryHeader extends StatelessWidget {
  final String title;
  final String? imagePath;
  final int fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final double iconWidth;
  final double iconHeight;

  const CategoryHeader({
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
      width: 208.webW(context),
      child: Row(
        children: [
          title.toTextWeb(
            context: context,
            fontSize: fontSize,
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
