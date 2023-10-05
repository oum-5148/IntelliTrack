import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SquareTile extends StatelessWidget {
  final String svgPath;  // Change imagePath to svgPath

  const SquareTile({
    Key? key,  // Add Key? key here
    required this.svgPath,  // Change imagePath to svgPath
  }) : super(key: key);  // Initialize super with key

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(  // Use SvgPicture.asset instead of Image.asset
        svgPath,  // Use svgPath here
        height: 100,
        width: 180,
      ),
    );
  }
}
