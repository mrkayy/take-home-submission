import 'package:animated_number/animated_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take_home/utils/image_constant.dart';
import 'package:take_home/presentation/widgets/custom_svg_widget.dart';
import 'package:take_home/presentation/widgets/estitle_title_widget.dart';
import 'package:take_home/theme/light_theme.dart';

class Estates {
  Estates(
      {required this.image,
      required this.title,
      required this.delay,
      this.width,
      this.height,
      this.padding});
  final String image;
  final String title;
  final Duration delay;

  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
}

class HomeSliverPage extends StatefulWidget {
  const HomeSliverPage({super.key});

  @override
  State<HomeSliverPage> createState() => _HomeSliverPageState();
}

class _HomeSliverPageState extends State<HomeSliverPage> {
  final ScrollController sliverController =
      ScrollController(initialScrollOffset: -100);
  final _duration = 2.seconds;
  final double _rentoffers = 176;
  bool animateNext = false;
  final List<Estates> estates = [
    Estates(
        image: ImageConstants.imgHome1,
        title: '707, Magnolia Court',
        delay: 2.7.seconds,
        width: null),
    Estates(
        image: ImageConstants.imgHome3,
        title: '456, Oak Avenue',
        delay: 2.9.seconds,
        padding: EdgeInsets.only(left: 10.sp, right: 10.0.sp, bottom: 10.sp),
        width: 180.w),
    Estates(
        image: ImageConstants.imgHome2,
        title: '123, Maple Street',
        delay: 2.9.seconds,
        padding: EdgeInsets.only(left: 10.sp, right: 10.0.sp, bottom: 10.sp),
        width: 180.w),
    Estates(
        image: ImageConstants.imgHome4,
        title: '789, Elm Court',
        delay: 3.2.seconds,
        padding: EdgeInsets.only(left: 10.sp, right: 10.0.sp, bottom: 10.sp),
        width: 240.w),
    Estates(
        image: ImageConstants.imgHome5,
        title: '101, Pine Lane',
        delay: 3.3.seconds,
        padding: EdgeInsets.only(left: 10.sp, right: 10.0.sp, bottom: 10.sp),
        width: 120.w),
    Estates(
        image: ImageConstants.imgHome2,
        title: '202, Cedar Road',
        delay: 3.55.seconds,
        width: null),
    Estates(
        image: ImageConstants.imgHome4,
        title: '303, Birch Avenue',
        delay: 3.6.seconds,
        width: 180.w),
    Estates(
        image: ImageConstants.imgHome1,
        title: '404, Willow Lane',
        delay: 3.8.seconds,
        width: 180.w),
    Estates(
        image: ImageConstants.imgHome5,
        title: '505, Sycamore Street',
        delay: 4.2.seconds,
        width: 290.w),
    Estates(
        image: ImageConstants.imgHome3,
        title: '606, Cherry Avenue',
        delay: 4.4.seconds,
        width: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        // Colors.white,
        appTheme.primary50,
        appTheme.primary50,
        appTheme.primaryAccent,
        Colors.white,
        Colors.white,
      ], begin: Alignment.topCenter, end: Alignment.bottomRight)),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: RepaintBoundary(
          child: SafeArea(
            bottom: false,
            child: CustomScrollView(
              controller: sliverController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: 1.0.sh,
                  scrolledUnderElevation: 120.sp,
                  actions: [
                    Container(
                      margin: EdgeInsets.only(right: 16.sp),
                      width: 42.0.w,
                      height: 42.0.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orangeAccent.shade100),
                      child: CustomSvgImageWidget(
                        imagePath: ImageConstants.avatar,
                      ),
                    ).animate().scale(duration: _duration, curve: Curves.easeIn)
                  ],
                  centerTitle: false,
                  title: Container(
                    height: 42.0.h,
                    width: 145.0.w,
                    padding: EdgeInsets.symmetric(horizontal: 14.0.sp),
                    decoration: BoxDecoration(
                        color: appTheme.offWhite,
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
                          padding: EdgeInsets.only(left: 5.0.sp),
                          child: Text(
                            'Lagos, Nigeria',
                            style: TextStyle(
                                fontFamily: 'Euclid',
                                fontSize: 12.sp,
                                color: appTheme.secondary,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ).animate().fadeIn().scaleX(begin: 0, end: 1),
                  ).animate(delay: _duration).scaleX(
                      curve: Curves.easeIn,
                      begin: 0,
                      end: 1,
                      alignment: Alignment.centerLeft),
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [StretchMode.blurBackground],
                    collapseMode: CollapseMode.none,
                    background: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          90.0.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0.r),
                            child: Text(
                              'Hi, Marina',
                              style: TextStyle(
                                  fontFamily: 'Euclid',
                                  color: appTheme.secondary,
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.2.sp),
                            ).animate().fadeIn(duration: _duration),
                          ),
                          5.0.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
                            child: SizedBox(
                              width: 250.w,
                              child: Text(
                                'let\'s select your perfect place',
                                style: TextStyle(
                                    fontFamily: 'Euclid',
                                    fontSize: 32.0.sp,
                                    fontWeight: FontWeight.w500,
                                    color: appTheme.neutral,
                                    height: 1.1.sp,
                                    letterSpacing: -0.4.sp),
                              )
                                  .animate(
                                      delay: const Duration(milliseconds: 400))
                                  .fadeIn(duration: _duration),
                            ),
                          ),
                          40.0.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: _rentoffers,
                                  width: _rentoffers,
                                  padding: EdgeInsets.all(16.sp),
                                  // margin: EdgeInsets.only(right: 8.sp),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: appTheme.primary),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'BUY',
                                        style: TextStyle(
                                            fontFamily: 'Euclid',
                                            fontSize: 13.0.sp,
                                            fontWeight: FontWeight.w500,
                                            color: appTheme.white),
                                      ),
                                      const Spacer(),
                                      AnimatedNumber(
                                        startValue: 0,
                                        endValue: 12928,
                                        duration: _duration,
                                        isFloatingPoint: false,
                                        decimalPoint: 4,
                                        style: TextStyle(
                                            fontSize: 36.0.sp,
                                            fontWeight: FontWeight.w800,
                                            color: appTheme.white,
                                            letterSpacing: 2,
                                            fontFamily: 'Euclid',
                                            height: 1.0.sp),
                                      ),
                                      Text(
                                        'offers',
                                        style: TextStyle(
                                            fontSize: 13.0.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Euclid',
                                            color: appTheme.white),
                                      ),
                                      34.0.verticalSpace,
                                    ],
                                  ),
                                ),
                                8.horizontalSpace,
                                Container(
                                  height: _rentoffers,
                                  width: _rentoffers,
                                  padding: EdgeInsets.all(14.sp),
                                  // margin: EdgeInsets.only(left: 8.sp),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(18.0.sp),
                                    shape: BoxShape.rectangle,
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          appTheme.primary50,
                                          appTheme.white,
                                          // appTheme.primaryAccent,
                                        ]),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'RENT',
                                        style: TextStyle(
                                            color: appTheme.secondary,
                                            fontFamily: 'Euclid',
                                            fontSize: 13.0.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Spacer(),
                                      AnimatedNumber(
                                        startValue: 0,
                                        endValue: 31019,
                                        duration: _duration,
                                        isFloatingPoint: false,
                                        decimalPoint: 4,
                                        style: TextStyle(
                                            color: appTheme.secondary,
                                            fontFamily: 'Euclid',
                                            fontSize: 36.0.sp,
                                            letterSpacing: 2.sp,
                                            fontWeight: FontWeight.w800,
                                            height: 1.0.sp),
                                      ),
                                      Text(
                                        'offers',
                                        style: TextStyle(
                                            color: appTheme.secondary,
                                            fontFamily: 'Euclid',
                                            fontSize: 13.0.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      28.0.verticalSpace,
                                    ],
                                  ),
                                ),
                              ],
                            )
                                .animate(
                                    delay: 780.milliseconds,
                                    onComplete: (cc) {
                                      sliverController
                                          .animateTo(0.75.sh,
                                              duration: 1.2.seconds,
                                              curve: Curves.fastOutSlowIn)
                                          .whenComplete(() => setState(() {
                                                animateNext = true;
                                                Future.delayed(3.seconds, () {
                                                  sliverController.animateTo(
                                                      0.501.sh,
                                                      duration: 2.3.seconds,
                                                      curve:
                                                          Curves.fastOutSlowIn);
                                                });
                                              }));
                                    })
                                .scale(duration: _duration),
                          ),
                        ]),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    // height: MediaQuery.of(context).size.height.sp * 0.68,
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(left: 10.sp, right: 10.sp, top: 10.sp),
                    decoration: BoxDecoration(
                        color: appTheme.white,
                        borderRadius: BorderRadius.circular(20.0.sp)),

                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 6.sp,
                      children: estates
                          .map((e) => EstateTileWidget(
                                animate: animateNext,
                                image: e.image,
                                title: e.title,
                                delay: e.delay,
                                width: e.width,
                                padding: e.padding,
                              ))
                          .toList(),
                    ),
                  )
                      .animate()
                      .slideY(duration: 1.5.seconds, end: 0.0, begin: 1.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
