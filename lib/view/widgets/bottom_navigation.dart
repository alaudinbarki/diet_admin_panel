// import 'package:base_code/utils/constant.dart';
// import 'package:base_code/view/widgets/extention/int_extension.dart';
// import 'package:base_code/view/widgets/extention/string_extension.dart';
// import 'package:base_code/view/widgets/extention/widget_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'package:provider/provider.dart';
//
// import '../../helper/routes_helper.dart';
// import '../../provider/bottom_navigation_provider.dart';
// import '../../utils/colors.dart';
// import '../../utils/images.dart';
//
// // =============================================================================
//
// class BottomNavigation extends StatelessWidget {
//   const BottomNavigation({Key? key, required this.currentIndex}) : super(key: key);
//   final int currentIndex;
//   // Bottom navigation the the bottom navigation bar of the app
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Consumer<BottomNavigationProvider>(
//         builder: (context, controller, child) {
//       return BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           unselectedFontSize: 10,
//           selectedFontSize: 10,
//           selectedItemColor: greenPrimary,
//           unselectedItemColor: blackPrimary,
//           backgroundColor: whitePrimary,
//           elevation: 5,
//           currentIndex: controller.currentIndex,
//           onTap: (index) {
//             // set the current index of the bottom navigation bar
//             // the function is declared inside BottomNavigationProvider
//
//             controller.setCurrentIndex(index);
//             if(currentIndex != index) {
//               switch (index) {
//               case 0:
//                 Navigator.of(context).pushNamedAndRemoveUntil(
//                     RouterHelper.homeScreen, (route) => false);
//                 break;
//               case 1:
//                 Navigator.of(context).pushNamedAndRemoveUntil(
//                     RouterHelper.favoriteScreen, (route) => false);
//                 break;
//               case 2:
//                 Navigator.of(context).pushNamedAndRemoveUntil(
//                     RouterHelper.notificationScreen, (route) => false);
//                 break;
//               case 3:
//                 Navigator.of(context).pushNamedAndRemoveUntil(
//                     RouterHelper.settingScreen, (route) => false);
//                 break;
//             }
//             }
//           },
//           items: <BottomNavigationBarItem>[
//             // HOME
//             BottomNavigationBarItem(
//                 icon: SvgPicture.asset(
//                   controller.currentIndex == 0
//                       ? Images.iconHomeFill
//                       : Images.iconHome,
//                   height: 25.w,
//                   width: 25.w,
//                 ).paddingOnly(bottom: 5.h),
//                 label: Constant.home),
//             // FAVORITE
//             BottomNavigationBarItem(
//                 icon: SvgPicture.asset(
//                   controller.currentIndex == 1
//                       ? Images.iconFavoriteFill
//                       : Images.iconFavorite,
//                   height: 25.w,
//                   width: 25.w,
//                 ).paddingOnly(bottom: 5.h),
//                 label: Constant.favorite),
//             // NOTIFICATION
//             BottomNavigationBarItem(
//                 icon: Stack(children: [
//                   SvgPicture.asset(
//                     controller.currentIndex == 2
//                         ? Images.iconBellFill
//                         : Images.iconBell,
//                     height: 22.w,
//                     width: 22.w,
//                   ).paddingOnly(bottom: 5.h),
//                   Positioned(
//                       right: 0,
//                       child: controller.currentIndex == 2
//                           ? const SizedBox()
//                           : Container(
//                               height: 12.w,
//                               width: 12.w,
//                               decoration: const BoxDecoration(
//                                   color: redPrimary, shape: BoxShape.circle),
//                               child: "2"
//                                   .toText(color: whitePrimary, fontSize: 7)
//                                   .center,
//                             ))
//                 ]),
//                 label: Constant.notification),
//             // SETTING
//             BottomNavigationBarItem(
//                 icon: SvgPicture.asset(
//                   controller.currentIndex == 3
//                       ? Images.iconSettingFill
//                       : Images.iconSetting,
//                   height: 25.w,
//                   width: 25.w,
//                 ).paddingOnly(bottom: 5.h),
//                 label: Constant.setting),
//           ]);
//     });
//   }
// }
