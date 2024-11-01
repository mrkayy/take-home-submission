// ignore_for_file: public_member_api_docs, sort_constructors_first

import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:take_home/image_constant.dart";
import "package:take_home/presentation/widgets/nav_icons.dart";
import "package:take_home/theme/light_theme.dart";

// class DrawerMenu {
//   final Function(BuildContext) callback;
//   final String svgIcon;
//   final String title;
//   DrawerMenu({
//     required this.callback,
//     required this.svgIcon,
//     required this.title,
//   });
// }

class TabNavigationScreen extends StatefulWidget {
  const TabNavigationScreen({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>("ScaffoldWithNavBar"));

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is a Navigator.
  final StatefulNavigationShell navigationShell;

  @override
  State<TabNavigationScreen> createState() => _TabNavigationScreenState();
}

class _TabNavigationScreenState extends State<TabNavigationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animController1 = AnimationController(vsync: this);

  final List<String> _menuListIcon = [
    ImageConstants.searchBold,
    ImageConstants.chat,
    ImageConstants.home,
    ImageConstants.heart,
    ImageConstants.profile,
  ];

  // int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        height: 60.0.h,
        margin: EdgeInsets.only(left: 63.0.sp, right: 63.0.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0.sp),
          color: appTheme.gray100,
        ),
        child: NavigationBar(
          indicatorColor: appTheme.primary,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorShape: const CircleBorder(),
          destinations: List.generate(_menuListIcon.length, (index) {
            return CustomBottomNavIcon(
              icon: _menuListIcon[index],
              selectedIndex: widget.navigationShell.currentIndex,
              index: index,
            );
          }),
          onDestinationSelected: (destination) =>
              _onItemTapped(destination, context),
          // onDestinationSelected: (selected) {
          //   setState(() {
          //     currentPageIndex = selected;
          //   });
          // },
          selectedIndex: widget.navigationShell.currentIndex,
        ),
      ).animate(autoPlay: true, delay: 2.seconds).slideY(
          curve: Curves.easeInOut, duration: 7.6.seconds, end: 0.0, begin: 2.0),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
