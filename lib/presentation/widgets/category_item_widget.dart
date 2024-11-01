import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_home/presentation/widgets/custom_svg_widget.dart';

import '../../theme/light_theme.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title, icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Transform.scale(
            scale: 1,
            child:
                CustomSvgImageWidget(color: appTheme.gray50, imagePath: icon),
          ),
          8.horizontalSpace,
          Text(
            title,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
