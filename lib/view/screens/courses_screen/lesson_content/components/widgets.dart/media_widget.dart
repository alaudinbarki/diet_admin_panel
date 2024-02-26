// ignore_for_file: must_be_immutable

import 'package:base_code/provider/courses_provider.dart';
import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MediaContainer extends StatefulWidget {
  MediaContainer({super.key, required this.isPhone});
  bool isPhone = false;
  @override
  State<MediaContainer> createState() => _MediaContainerState();
}

class _MediaContainerState extends State<MediaContainer> {
  // Initial border colors for each container
  // List<Color> borderColors = [
  //   greySecondary,
  //   greySecondary,
  //   greySecondary,
  //   greySecondary,
  // ];

  // void _onContainerTap(int index) {
  //   Provider.of<CoursesProvider>(context, listen: false).pickLessionImage();
  //   setState(() {
  //     selected = mediaList[index];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesProvider>(builder: (context, value, _) {
      return widget.isPhone
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                value.mediaList.length,
                (index) => Expanded(
                  child: InkWell(
                    onTap: () => value.onContainerTap(index),
                    child: Container(
                      height: 80.h,
                      width: 197.w,

                      margin: const EdgeInsets.all(
                          8.0), // Space between the containers
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: whiteShedow, // Use actual dark grey color
                        border: Border.all(
                          color: value.mediaList[index] == value.selected
                              ? Colors.black
                              : greySecondary, // Border color based on state
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: value.mediaList[index]['selected'] != null
                          ? Image.memory(value.mediaList[index]['selected'])
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  value.mediaList[index]['image'] ?? "",
                                  width: 50,
                                  height: 50,
                                ),
                                // const Icon(Icons.camera_alt,
                                //     color: blackPrimary), // Replace with actual icon
                                const SizedBox(width: 8),
                                value.mediaList[index]['name']!.toText(
                                    fontSize: 8,
                                    color: blackPrimary,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                value.mediaList.length,
                (index) => Expanded(
                  child: InkWell(
                    onTap: () => value.onContainerTap(index),
                    child: Container(
                      height: 150.webH(context),
                      width: 297.webW(context),

                      margin: const EdgeInsets.all(
                          8.0), // Space between the containers
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: whiteShedow, // Use actual dark grey color
                        border: Border.all(
                          color: value.mediaList[index] == value.selected
                              ? Colors.black
                              : greySecondary, // Border color based on state
                          width: 1.webT(context),
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: value.mediaList[index]['selected'] != null
                          ? Image.memory(value.mediaList[index]['selected'])
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  value.mediaList[index]['image'] ?? "",
                                  width: 30,
                                  height: 30,
                                ),
                                // const Icon(Icons.camera_alt,
                                //     color: blackPrimary), // Replace with actual icon
                                const SizedBox(width: 8),
                                Text(
                                  value.mediaList[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: blackPrimary,
                                      fontWeight: FontWeight.w700),
                                )
                                // value.mediaList[index]['name'].toTextWeb(
                                //     context: context,
                                //     fontSize: 16,
                                //     color: blackPrimary,
                                //     fontWeight: FontWeight.w600),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
