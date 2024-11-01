import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:take_home/image_constant.dart';
import 'package:take_home/presentation/widgets/custom_appBar.dart';
import 'package:take_home/presentation/widgets/custom_svg_widget.dart';
import 'package:take_home/theme/light_theme.dart';

enum FilterOptions { price, location, area, infrastructure }

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static String path = '/search_pg';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 800);

  late AnimationController popupController;

  @override
  void initState() {
    popupController = AnimationController(vsync: this, duration: _duration);
    super.initState();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar.searchBar(duration: _duration),
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Positioned(
              bottom: 115.h,
              right: 16.0.w,
              child: Container(
                height: 45.h,
                width: 145.w,
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.sp),
                  color: appTheme.gray50.withOpacity(0.6),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.wrap_text,
                      color: appTheme.gray50,
                    ),
                    5.horizontalSpace,
                    Text(
                      'List of variants',
                      style: TextStyle(color: appTheme.gray50, fontSize: 12.sp),
                    )
                  ],
                ),
              ).animate().scale(duration: _duration),
            ),
            Positioned(
              bottom: 115.h,
              left: 16.0.w,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      popupController.forward();
                    },
                    child: Container(
                      width: 45.w,
                      padding: EdgeInsets.all(10.sp),
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: appTheme.gray50.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      child: CustomSvgImageWidget(
                        color: appTheme.gray50,
                        // width: 8.0.sp,
                        // height: 8.0.sp,
                        imagePath: ImageConstants.wallet,
                      ),
                    ).animate().scale(duration: _duration),
                  ),
                  8.verticalSpace,
                  Container(
                    width: 45.w,
                    padding: EdgeInsets.all(10.sp),
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: appTheme.gray50.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    child: CustomSvgImageWidget(
                      color: appTheme.gray50,
                      // width: 8.0.sp,
                      // height: 8.0.sp,
                      imagePath: ImageConstants.send,
                    ),
                  ).animate().scale(duration: _duration),
                ],
              ),
            ),
            Positioned(
              bottom: 170.h,
              left: 16.0.w,
              child: GestureDetector(
                onTap: () {
                  popupController.reverse();
                },
                child: Container(
                  width: 158.w,
                  height: 185.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    color: appTheme.primary50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1,
                              child: CustomSvgImageWidget(
                                color: appTheme.gray50,
                                imagePath: ImageConstants.filter,
                              ),
                            ),
                            8.horizontalSpace,
                            Text(
                              'Cosy areas',
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1,
                              child: CustomSvgImageWidget(
                                color: appTheme.primary,
                                imagePath: ImageConstants.wallet,
                              ),
                            ),
                            8.horizontalSpace,
                            Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  color: appTheme.primary),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.shopping_basket_rounded,
                              color: appTheme.gray50,
                              size: 18.0.sp,
                            ),
                            8.horizontalSpace,
                            Text(
                              'Infrastructure',
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1,
                              child: CustomSvgImageWidget(
                                color: appTheme.gray50,
                                imagePath: ImageConstants.activity,
                              ),
                            ),
                            8.horizontalSpace,
                            Text(
                              'Without any layer',
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                    .animate(controller: popupController, autoPlay: false)
                    .scaleXY(begin: 0, end: 1, alignment: Alignment.bottomLeft),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
