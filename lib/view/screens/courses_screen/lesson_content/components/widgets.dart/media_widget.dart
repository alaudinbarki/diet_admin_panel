// ignore_for_file: must_be_immutable

import 'package:base_code/utils/colors.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:flutter/material.dart';

class MediaContainer extends StatefulWidget {
  MediaContainer({super.key, required this.isPhone});
  bool isPhone = false;
  @override
  _MediaContainerState createState() => _MediaContainerState();
}

class _MediaContainerState extends State<MediaContainer> {
  // Initial border colors for each container
  List<Color> borderColors = [
    greySecondary,
    greySecondary,
    greySecondary,
    greySecondary,
  ];

  // Function to handle tap and change border color
  void _onContainerTap(int index) {
    setState(() {
      // Change the border color of the tapped container to black
      borderColors[index] = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isPhone
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => Expanded(
                child: InkWell(
                  onTap: () => _onContainerTap(index),
                  child: Container(
                    height: 80.h,
                    width: 197.w,

                    margin: const EdgeInsets.all(
                        8.0), // Space between the containers
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: whiteShedow, // Use actual dark grey color
                      border: Border.all(
                        color:
                            borderColors[index], // Border color based on state
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.camera_alt,
                            color: blackPrimary), // Replace with actual icon
                        const SizedBox(width: 8),
                        'Media'.toText(
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
              4,
              (index) => Expanded(
                child: InkWell(
                  onTap: () => _onContainerTap(index),
                  child: Container(
                    height: 150.webH(context),
                    width: 297.webW(context),

                    margin: const EdgeInsets.all(
                        8.0), // Space between the containers
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: whiteShedow, // Use actual dark grey color
                      border: Border.all(
                        color:
                            borderColors[index], // Border color based on state
                        width: 1.webT(context),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.camera_alt,
                            color: blackPrimary), // Replace with actual icon
                        const SizedBox(width: 8),
                        'Media'.toTextWeb(
                            context: context,
                            fontSize: 16,
                            color: blackPrimary,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
