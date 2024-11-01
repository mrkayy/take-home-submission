import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_home/utils/image_constant.dart';
import 'package:take_home/presentation/widgets/custom_svg_widget.dart';
import 'package:take_home/theme/light_theme.dart';

class NothingToSeePage extends StatelessWidget {
  static String path = '/404';
  const NothingToSeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomSvgImageWidget(
            height: 50.0.r,
            width: 50.0.r,
            imagePath: ImageConstants.search,
          ),
          8.verticalSpace,
          Center(
            child: Text(
              'Nothing to see here!',
              style: TextStyle(color: appTheme.neutral, fontSize: 14),
            ),
          ).animate(effects: const [FadeEffect(), ShakeEffect()]),
        ],
      ),
    );
  }
}
