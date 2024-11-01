import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:take_home/presentation/widgets/category_item_widget.dart';
import 'package:take_home/utils/image_constant.dart';
import 'package:take_home/presentation/widgets/custom_appBar.dart';
import 'package:take_home/presentation/widgets/custom_svg_widget.dart';
import 'package:take_home/theme/light_theme.dart';

enum FilterOptions { price, location, area, infrastructure }

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 800);

  final CustomInfoWindowController infoWindowController =
      CustomInfoWindowController();
  late AnimationController popupController;
  late AnimationController markerController;
  String mapTheme = '';
  BitmapDescriptor customMarker = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    popupController = AnimationController(vsync: this, duration: _duration);
    markerController = AnimationController(vsync: this, duration: _duration);
    DefaultAssetBundle.of(context)
        .loadString('assets/maps_theme/style.json')
        .then((str) => mapTheme = str);
    customMarkerIcon();
    super.initState();
  }

  void onTapMarker(LatLng latlng) {
    markerController.forward();
    infoWindowController.addInfoWindow!(
      infoWidget,
      latlng,
    );
  }

  void customMarkerIcon() {
    BitmapDescriptor.asset(
            const ImageConfiguration(), "assets/img/custom_marker.png")
        .then((icon) {
      setState(() {
        customMarker = icon;
      });
    });
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Offset anchorOffset = const Offset(1.82, 2.3);
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.614494939872578, 3.358143425137926),
    zoom: 14.4746,
  );

  late final Widget infoWidget = Container(
    width: 90.w,
    height: 25.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: appTheme.primary,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r))),
    child: Text(
      "78mm, P",
      style: TextStyle(color: appTheme.white),
    ),
  )
      .animate(controller: markerController, autoPlay: false)
      .scaleXY(begin: 0, end: 1, alignment: Alignment.bottomLeft);

  // late final Set<Marker> _markers = {
  //   Marker(
  //     anchor: anchorOffset,
  //     markerId: const MarkerId("one"),
  //     icon: customMarker,
  //     position: const LatLng(6.614494939872578, 3.358143425137926),
  //     onTap: () => onTapMarker(
  //       const LatLng(6.614494939872578, 3.358143425137926),
  //     ),
  //   ),
  //   Marker(
  //       markerId: const MarkerId("two"),
  //       anchor: anchorOffset,
  //       icon: customMarker,
  //       position: const LatLng(6.617255204209288, 3.359634733275134),
  //       onTap: () =>
  //           onTapMarker(const LatLng(6.617255204209288, 3.359634733275134))),
  //   Marker(
  //     markerId: const MarkerId("three"),
  //     anchor: anchorOffset,
  //     icon: customMarker,
  //     position: const LatLng(6.615195934840264, 3.3549266424542483),
  //     onTap: () =>
  //         onTapMarker(const LatLng(6.615195934840264, 3.3549266424542483)),
  //   ),
  //   Marker(
  //     markerId: const MarkerId("four"),
  //     anchor: anchorOffset,
  //     icon: customMarker,
  //     position: const LatLng(6.610994559120007, 3.352754728377859),
  //     onTap: () =>
  //         onTapMarker(const LatLng(6.610994559120007, 3.352754728377859)),
  //   ),
  //   Marker(
  //     markerId: const MarkerId("five"),
  //     anchor: anchorOffset,
  //     icon: customMarker,
  //     position: const LatLng(6.606647594245417, 3.348863307422518),
  //     onTap: () =>
  //         onTapMarker(const LatLng(6.606647594245417, 3.348863307422518)),
  //   ),
  //   Marker(
  //     markerId: const MarkerId("six"),
  //     anchor: anchorOffset,
  //     icon: customMarker,
  //     position: const LatLng(6.623703162997785, 3.353045392437806),
  //     onTap: () =>
  //         onTapMarker(const LatLng(6.623703162997785, 3.353045392437806)),
  //   ),
  //   Marker(
  //     markerId: const MarkerId("seven"),
  //     anchor: anchorOffset,
  //     icon: customMarker,
  //     position: const LatLng(6.624157355808864, 3.3509981816152314),
  //     onTap: () =>
  //         onTapMarker(const LatLng(6.624157355808864, 3.3509981816152314)),
  //   ),
  //   Marker(
  //     markerId: const MarkerId("eight"),
  //     anchor: anchorOffset,
  //     icon: customMarker,
  //     position: const LatLng(6.608527441112896, 3.357733705628045),
  //     onTap: (() =>
  //         onTapMarker(const LatLng(6.608527441112896, 3.357733705628045))),
  //   ),
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar.searchBar(duration: _duration),
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              // mapType: MapType.hybrid,
              myLocationButtonEnabled: false,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                infoWindowController.googleMapController = controller;
                controller.setMapStyle(mapTheme);
                _controller.complete(controller);
              },
              onTap: (location) {
                markerController.reverse().whenComplete(() {
                  infoWindowController.hideInfoWindow!();
                });
              },
              onCameraMove: (position) {
                infoWindowController.onCameraMove!();
              },
              markers: {
                Marker(
                  anchor: anchorOffset,
                  markerId: const MarkerId("one"),
                  icon: customMarker,
                  position: const LatLng(6.614494939872578, 3.358143425137926),
                  onTap: () => onTapMarker(
                    const LatLng(6.614494939872578, 3.358143425137926),
                  ),
                ),
                Marker(
                    markerId: const MarkerId("two"),
                    anchor: anchorOffset,
                    icon: customMarker,
                    position:
                        const LatLng(6.617255204209288, 3.359634733275134),
                    onTap: () => onTapMarker(
                        const LatLng(6.617255204209288, 3.359634733275134))),
                Marker(
                  markerId: const MarkerId("three"),
                  anchor: anchorOffset,
                  icon: customMarker,
                  position: const LatLng(6.615195934840264, 3.3549266424542483),
                  onTap: () => onTapMarker(
                      const LatLng(6.615195934840264, 3.3549266424542483)),
                ),
                Marker(
                  markerId: const MarkerId("four"),
                  anchor: anchorOffset,
                  icon: customMarker,
                  position: const LatLng(6.610994559120007, 3.352754728377859),
                  onTap: () => onTapMarker(
                      const LatLng(6.610994559120007, 3.352754728377859)),
                ),
                Marker(
                  markerId: const MarkerId("five"),
                  anchor: anchorOffset,
                  icon: customMarker,
                  position: const LatLng(6.606647594245417, 3.348863307422518),
                  onTap: () => onTapMarker(
                      const LatLng(6.606647594245417, 3.348863307422518)),
                ),
                Marker(
                  markerId: const MarkerId("six"),
                  anchor: anchorOffset,
                  icon: customMarker,
                  position: const LatLng(6.623703162997785, 3.353045392437806),
                  onTap: () => onTapMarker(
                      const LatLng(6.623703162997785, 3.353045392437806)),
                ),
                Marker(
                  markerId: const MarkerId("seven"),
                  anchor: anchorOffset,
                  icon: customMarker,
                  position: const LatLng(6.624157355808864, 3.3509981816152314),
                  onTap: () => onTapMarker(
                      const LatLng(6.624157355808864, 3.3509981816152314)),
                ),
                Marker(
                  markerId: const MarkerId("eight"),
                  anchor: anchorOffset,
                  icon: customMarker,
                  position: const LatLng(6.608527441112896, 3.357733705628045),
                  onTap: (() => onTapMarker(
                      const LatLng(6.608527441112896, 3.357733705628045))),
                ),
              },
            ),
            CustomInfoWindow(
              controller: infoWindowController,
              height: 42.h,
              width: 90.w,
              offset: 42,
            ),
            Positioned(
              bottom: 115.h,
              right: 16.w,
              child: Container(
                height: 45.h,
                width: 145.w,
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.sp),
                  color: appTheme.gray50.withOpacity(0.6),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.wrap_text,
                      color: appTheme.white.withOpacity(0.5),
                    ),
                    // 5.horizontalSpace,
                    Text(
                      'List of variants',
                      style: TextStyle(
                          color: appTheme.white.withOpacity(0.5),
                          fontSize: 12.sp),
                    )
                  ],
                ),
              ).animate().scale(duration: _duration),
            ),
            Positioned(
              bottom: 115.h,
              left: 16.w,
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
                        color: appTheme.white.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: CustomSvgImageWidget(
                        color: appTheme.white.withOpacity(0.5),
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
                      color: appTheme.white.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: CustomSvgImageWidget(
                      color: appTheme.white.withOpacity(0.5),
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
                  markerController.reverse().whenComplete(() {
                    infoWindowController.hideInfoWindow!();
                  });
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
                      const CategoryItemWidget(
                        title: 'Cosy areas',
                        icon: ImageConstants.filter,
                      ),
                      const CategoryItemWidget(
                        title: 'Price',
                        icon: ImageConstants.wallet,
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
                      const CategoryItemWidget(
                        title: 'Without any layer',
                        icon: ImageConstants.activity,
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
