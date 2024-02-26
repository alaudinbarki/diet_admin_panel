import 'package:base_code/provider/authentication_provider.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../screens/dashboard/components/custom_popup_menu.dart';

class WebHeader extends StatelessWidget {
  const WebHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, value, _) {
      return Container(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10000),
                  child: AppNetworkImage(
                    width: 50.webT(context),
                    height: 50.webT(context),
                    image: value.adminData!.picture,
                    errorPlaceHolder: Images.iconProfileImage,
                  ),
                ),
                // CustomImage(
                //     image: Images.iconProfileImage,
                //     width: 50.webT(context),
                //     height: 50.webT(context)),
                10.webWidth(context),
                '${value.adminData!.firstName} ${value.adminData!.lastName}'
                    .toTextWeb(
                        context: context, fontSize: 22, color: blackPrimary),
                CustomPopupMenuButton()
              ],
            )
          ],
        ),
      );
    });
  }
}
