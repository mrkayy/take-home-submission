import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_home/utils/image_constant.dart';
import 'package:take_home/presentation/widgets/custom_svg_widget.dart';
import 'package:take_home/theme/light_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.duration,
    super.key,
  }) : type = AppBarType.appbar;
  const CustomAppBar.searchBar({
    this.duration,
    super.key,
  }) : type = AppBarType.searchbar;

  final AppBarType type;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return {
      AppBarType.appbar: _buildAppBar(context),
      AppBarType.searchbar: _buildSearchBar(context),
    }[type]!;
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
      // margin: EdgeInsets.only(top: 44.0.sp),
      constraints: const BoxConstraints.expand(),
      // height: 103.0.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 42.0.h,
            width: 145.0.w,
            padding: EdgeInsets.symmetric(horizontal: 14.0.sp),
            decoration: BoxDecoration(
                color: appTheme.primary50,
                borderRadius: BorderRadius.circular(8.0.sp)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomSvgImageWidget(
                  imagePath: ImageConstants.locationBold,
                  height: 12.0.sp,
                  width: 12.0.sp,
                  color: appTheme.secondary,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.0.r),
                  child: Text(
                    'Lagos, Nigeria',
                    style: TextStyle(
                        fontFamily: 'Euclid',
                        color: appTheme.secondary,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ).animate(delay: const Duration(milliseconds: 300)).fadeIn(),
          ).animate().scaleX(begin: 0, end: 1, alignment: Alignment.centerLeft),
          Container(
            width: 45.0.w,
            height: 45.0.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.orangeAccent.shade100),
            child: CustomSvgImageWidget(
              imagePath: ImageConstants.avatar,
            ),
          ).animate().scale(duration: duration)
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
        margin: EdgeInsets.only(top: 10.0.sp),
        constraints: const BoxConstraints.expand(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            22.horizontalSpace,
            Expanded(
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Transform.scale(
                      scale: 0.5,
                      child: CustomSvgImageWidget(
                        color: appTheme.gray100,
                        imagePath: ImageConstants.search,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.sp),
                    filled: true,
                    fillColor: appTheme.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0.sp),
                      ),
                    ),
                    hintStyle:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
                    hintText: 'Search reservation'),
              ).animate().scale(duration: duration),
            ),
            10.horizontalSpace,
            Container(
              height: 45.h,
              width: 45.w,
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                color: appTheme.white,
                shape: BoxShape.circle,
              ),
              child: CustomSvgImageWidget(
                color: appTheme.gray100,
                imagePath: ImageConstants.filter,
              ),
            ).animate().scale(duration: duration),
            22.horizontalSpace,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 69.sp);
}

enum AppBarType { appbar, searchbar }
