
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../provider/on_boarding_provider.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/constant.dart';
import '../../../../utils/images.dart';
import '../../../../utils/style.dart';

class WebSlider extends StatelessWidget {
  const WebSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OnBoardingProvider>(builder: (context, controller, child) {
      return Column(
        children: [
          SizedBox(
            height: 820.webH(context),
            child: PageView(
              controller: controller.pageController,
              clipBehavior: Clip.antiAlias,
              onPageChanged: (int page) {
                controller.nextPageBySlide(page);
              },
              children: [
                Column(
                  children: [
                    90.webHeight(context),
                    SvgPicture.asset(
                      Images.imgOnBoarding1,
                      height: 500.webH(context),
                    ),
                    90.webHeight(context),
                    SizedBox(
                      height: 140.webH(context),
                      child:
                          Constant.trackDifferentProductsDescription.toTextWeb(
                        context: context,
                        color: whitePrimary,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLine: 3,
                        fontSize: 28,
                        fontFamily: poppinsLight,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    75.webHeight(context),
                    SvgPicture.asset(
                      Images.imgOnBoarding2,
                      height: 500.webH(context),
                    ),
                    90.webHeight(context),
                    SizedBox(
                      height: 140.webH(context),
                      child: Constant.trackAnyDealDescription.toTextWeb(
                        context: context,
                        color: whitePrimary,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLine: 3,
                        fontSize: 28,
                        fontFamily: poppinsLight,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    75.webHeight(context),
                    SvgPicture.asset(
                      Images.imgOnBoarding3,
                      height: 500.webH(context),
                    ),
                    90.webHeight(context),
                    SizedBox(
                      height: 140.webH(context),
                      child: Constant.trackPriceHistoryDescription.toTextWeb(
                        context: context,
                        color: whitePrimary,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLine: 3,
                        fontSize: 28,
                        fontFamily: poppinsLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.webHeight(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20.webH(context),
                width: controller.currentPage == 0
                    ? 50.webW(context)
                    : 20.webH(context),
                decoration: BoxDecoration(
                    color: controller.currentPage == 0
                        ? whitePrimary
                        : greySecondary,
                    borderRadius: BorderRadius.circular(50)),
              ),
              20.webWidth(context),
              Container(
                height: 20.webH(context),
                width: controller.currentPage == 1
                    ? 50.webW(context)
                    : 20.webH(context),
                decoration: BoxDecoration(
                    color: controller.currentPage == 1
                        ? whitePrimary
                        : greySecondary,
                    borderRadius: BorderRadius.circular(50)),
              ),
              20.webWidth(context),
              Container(
                height: 20.webH(context),
                width: controller.currentPage == 2
                    ? 50.webW(context)
                    : 20.webH(context),
                decoration: BoxDecoration(
                    color: controller.currentPage == 2
                        ? whitePrimary
                        : greySecondary,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ],
          ),
        ],
      ).onPress(() {
        controller.nextPageByButton(context);
      });
    });
  }
}
