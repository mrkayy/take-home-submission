import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_home/presentation/widgets/custom_svg_widget.dart';
import 'package:take_home/theme/light_theme.dart';

class CustomBottomNavIcon extends StatelessWidget {
  const CustomBottomNavIcon(
      {super.key,
      required this.icon,
      required this.index,
      required this.selectedIndex});
  final String icon;
  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 42.0.w,
      height: 42.0.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == selectedIndex ? appTheme.primary : appTheme.neutral),
      child: NavigationDestination(
        label: '',
        icon: CustomSvgImageWidget(
          width: 24.0.sp,
          height: 24.0.sp,
          imagePath: icon,
        ),
      ),
    );
  }
}
