import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_home/utils/image_constant.dart';
import 'package:take_home/presentation/widgets/custom_svg_widget.dart';
import 'package:take_home/theme/light_theme.dart';

class EstateTileWidget extends StatelessWidget {
  const EstateTileWidget({
    super.key,
    required this.image,
    required this.title,
    required this.delay,
    required this.animate,
    this.width,
    this.padding,
  });

  final double? width;
  final EdgeInsetsGeometry? padding;
  final String image;
  final String title;
  final Duration delay;
  final bool animate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: width?.w ?? 375.w,
      margin: EdgeInsets.only(bottom: 10.sp),
      padding:
          padding ?? const EdgeInsets.only(bottom: 10, left: 22, right: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(48.sp),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48.sp),
                color: appTheme.primary50.withOpacity(0.5),
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    30.horizontalSpace,
                    Flexible(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: appTheme.neutral,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      width: 47.w,
                      height: 47.h,
                      padding: EdgeInsets.all(13.sp),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: appTheme.primary50,
                          boxShadow: [
                            BoxShadow(
                                color: appTheme.gray50,
                                blurRadius: 6,
                                spreadRadius: -1.76,
                                offset: const Offset(-1.2, 0))
                          ]),
                      alignment: Alignment.center,
                      child: CustomSvgImageWidget(
                        imagePath: ImageConstants.arrowRight,
                        color: appTheme.gray50,
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ).animate(target: animate ? 1 : 0).scaleX(
          alignment: Alignment.centerLeft,
          begin: 0,
          end: 1,
          curve: Curves.fastOutSlowIn),
    );
  }
}
