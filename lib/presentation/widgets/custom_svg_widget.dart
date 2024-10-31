import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgImageWidget extends StatelessWidget {
  CustomSvgImageWidget(
      {super.key,
      this.imagePath,
      this.color,
      this.fit,
      this.height = 24.0,
      this.onTap,
      this.width = 24.0});

  String? imagePath;

  double? height;
  double? width;
  Color? color;
  BoxFit? fit;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          imagePath!,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          color: color,
        ),
      ),
    );
  }
}
