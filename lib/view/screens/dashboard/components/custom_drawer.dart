import 'package:base_code/data/model/custom_model/drawer_model.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/images.dart';
import 'package:base_code/view/widgets/custom_image.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/drawar_provider.dart';

class CustomDrawer extends StatefulWidget {
  bool? fromMobile;
  CustomDrawer({super.key, this.fromMobile = false});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawarProvider>(builder: (context, controller, _) {
      return Container(
        width: widget.fromMobile! ? 180.w : 310.webW(context),
        // height: 1294.webH(context),
        decoration: BoxDecoration(
            color: blueSecondary,
            borderRadius: BorderRadius.only(topRight: Radius.circular(widget.fromMobile! ? 10.w : 25.webT(context)))),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            widget.fromMobile! ? 20.height : 25.webHeight(context),
            Row(
              children: [
                CustomImage(
                    image: Images.iconDrawer,
                    width: widget.fromMobile! ? 18.w : 27.webT(context),
                    height: widget.fromMobile! ? 18.w : 20.webT(context)),
                widget.fromMobile! ? 20.width : 30.webWidth(context),
                CustomImage(
                    image: Images.imgLogo,
                    width: widget.fromMobile! ? 70.w : 160.webT(context),
                    height: widget.fromMobile! ? 45.h : 55.webT(context)),
              ],
            ),
            widget.fromMobile! ? 45.height : 50.webHeight(context),
            ListView.builder(
              itemCount: controller.drawerItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                DrawerItems item = controller.drawerItems[index];
                bool isSelected = item == controller.selectedItem;
                // Function to handle tap on an item
                void handleItemTap() {
                  if (item.isExpandable) {
                    // Toggle the expanded state of the item
                    item.isExpanded = true;
                    controller.setSelectedSubItem(item.subItems![0]);
                    Navigator.pushNamed(context, item.subItems![0].path!);
                  } else {
                    // If the item is not expandable, collapse any expanded subcategories
                    for (var drawerItem in controller.drawerItems) {
                      if (drawerItem != item) {
                        drawerItem.isExpanded =
                            false; // Ensures other items are not expanded
                      }
                    }
                  }

                  // Collapse all other items
                  for (var drawerItem in controller.drawerItems) {
                    if (drawerItem != item) {
                      drawerItem.isExpanded = false;
                    }
                  }

                  // Navigate if the item has a path and is not expandable or is expandable but not expanded
                  if (item.path != null &&
                      (!item.isExpandable || !item.isExpanded)) {
                    Navigator.pushNamed(context, item.path!);
                  }

                  controller.setSelectedItem(
                      item); // Set the current item as selected
                  controller.notifier(); // Notify listeners or update state
                }

                List<Widget> children = [
                  renderingBox(
                    context,
                    item.image ?? '',
                    isSelected,
                    item.title,
                    handleItemTap,
                    isLogout: false,
                  ),
                ];

                if (item.isExpandable && item.isExpanded) {
                  children.addAll(item.subItems!.map<Widget>((subItem) {
                    bool isSubItemSelected =
                        subItem == controller.selectedSubItem;
                    return renderingSubCategoryBox(
                      context,
                      subItem.image ?? '',
                      isSubItemSelected,
                      subItem.title,
                      () {
                        if (subItem.path != null) {
                          Navigator.pushNamed(context, subItem.path!);
                        }
                        controller.setSelectedSubItem(subItem);
                        controller
                            .notifier(); // Notify listeners or update state
                      },
                      widget.fromMobile!
                      // Additional parameters for styling if needed
                    );
                  }).toList());
                }

                return Container(
                    decoration: BoxDecoration(
                        color: item.isExpandable && item.isExpanded
                            ? whitePrimary.withOpacity(0.3)
                            : blueSecondary,
                        borderRadius: BorderRadius.circular(widget.fromMobile! ? 12.w : 15.webT(context))),
                    child: Column(children: children));
              },
            ),
            const Spacer(),
            Container(
              width: widget.fromMobile! ? 150.w : 290.webW(context),
              height: widget.fromMobile! ? 40.h : 60.webH(context),
              decoration: BoxDecoration(
                color: isSelected ? whitePrimary : blueSecondary,
                borderRadius: BorderRadius.circular(widget.fromMobile! ? 15.w : 20.webT(context)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImage(
                    image: Images.iconLogout,
                    width: widget.fromMobile! ? 15.w : 20.webT(context),
                    height: widget.fromMobile! ? 15.w : 20.webT(context),
                    iconColor: blackPrimary,
                  ),
                  widget.fromMobile! ? 7.width : 16.webWidth(context),
                  widget.fromMobile! ? "Logout".toText(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: blackPrimary,
                      ) : "Logout".toTextWeb(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: blackPrimary,
                      context: context),
                ],
              ).paddingSymmetric(horizontal: widget.fromMobile! ? 20.w : 25.webW(context)).center,
            ),
            widget.fromMobile! ? 40.height : 50.webHeight(context),
          ],
        ).paddingSymmetric(horizontal: widget.fromMobile! ? 20.w : 30.webW(context)),
      );
    });
  }

  renderingBox(BuildContext context, String icon, bool isSelected, String title,
      GestureTapCallback onTap,
      {bool isLogout = false}) {
    return Container(
      width: widget.fromMobile! ? 200.w : 290.webW(context),
      height: widget.fromMobile! ? 50.h : 60.webH(context),
      decoration: BoxDecoration(
        color: isSelected ? whitePrimary : blueSecondary,
        borderRadius: BorderRadius.circular(widget.fromMobile! ? 5.w : 15.webT(context)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon.isNotEmpty)
            Row(
              children: [
                CustomImage(
                  image: icon,
                  width: widget.fromMobile! ? 15.w : 20.webT(context),
                  height: widget.fromMobile! ? 15.w : 20.webT(context),
                  iconColor: isLogout
                      ? blackPrimary
                      : isSelected
                          ? bluePrimary
                          : whitePrimary,
                ),
                widget.fromMobile! ? 7.width : 16.webWidth(context),
              ],
            ),
          widget.fromMobile!
              ? title.toText(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isLogout
                  ? blackPrimary
                  : isSelected
                  ? bluePrimary
                  : whitePrimary,)
              : title.toTextWeb(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isLogout
                  ? blackPrimary
                  : isSelected
                      ? bluePrimary
                      : whitePrimary,
              context: context),
        ],
      ).paddingSymmetric(horizontal: widget.fromMobile! ? 10.w : 25.webW(context)).center,
    ).onPress(onTap);
  }
}

renderingSubCategoryBox(
  BuildContext context,
  String icon,
  bool isSelected,
  String title,
  GestureTapCallback onTap,
  bool isMobile
) {
  return SizedBox(
    width: isMobile ? 150.w : 290.webW(context),
    height: isMobile ? 40.h : 60.webH(context),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isMobile
            ? title.toText(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? bluePrimary : containerTextColor,
            )
            :  title.toTextWeb(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? bluePrimary : containerTextColor,
            context: context),
      ],
    ).paddingSymmetric(horizontal: isMobile ? 20.w : 25.webW(context)).center,
  ).onPress(onTap);
}
