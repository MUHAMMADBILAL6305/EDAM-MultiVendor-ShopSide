import 'package:edam_merchant/presentation/screens/my_nav_bar/home_dashboard/home_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../configurations/utils/my_app_colors.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key}) : super(key: key);

  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  String pageTitle = "Home";

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomeDashboardScreen(),
      HomeDashboardScreen(),
      HomeDashboardScreen(),
      HomeDashboardScreen(),
      // LiveStocks(),
      // MySearchScreen(),
      // MyProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        onPressed: (context) {
          setState(() {
            pageTitle = "Home";
            _controller.index = 0;
          });
        },
        activeColorPrimary: MyAppColors.appPrimaryColor,
        inactiveColorPrimary: MyAppColors.guestButtonColor.withOpacity(0.7),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svg/sheepIcon (4).svg',
          color: _controller.index == 1
              ? MyAppColors.appPrimaryColor
              : MyAppColors.guestButtonColor,
        ),
        title: ("LiveStock"),
        activeColorPrimary: MyAppColors.appPrimaryColor,
        inactiveColorPrimary: MyAppColors.guestButtonColor.withOpacity(0.7),
        onPressed: (context) {
          setState(() {
            pageTitle = "LiveStock";
            _controller.index = 1;
          });
        },
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => HomeDashboardScreen(),
            '/second': (context) => HomeDashboardScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: MyAppColors.appPrimaryColor,
        inactiveColorPrimary: MyAppColors.guestButtonColor.withOpacity(0.7),
        onPressed: (context) {
          setState(() {
            pageTitle = "Search";
            _controller.index = 2;
          });
        },
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => HomeDashboardScreen(),
            '/second': (context) => HomeDashboardScreen(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle),
        title: ("Profile"),
        activeColorPrimary: MyAppColors.appPrimaryColor,
        inactiveColorPrimary: MyAppColors.guestButtonColor.withOpacity(0.7),
        onPressed: (context) {
          setState(() {
            pageTitle = "Profile";
            _controller.index = 3;
          });
        },
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {},
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
        actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
        centerTitle: true,
        leading: _controller.index != 0
            ? IconButton(
                onPressed: () {
                  if (_controller.index > 0) {
                    setState(() {
                      pageTitle = "Home";
                      _controller.index = 0;
                    });
                  }
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).iconTheme.color,
                  size: 20,
                ),
              )
            : Container(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: JumpingText(
              'Edam',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: MyAppColors.appPrimaryColor),
            ),
          )
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).backgroundColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        onWillPop: (context) async {
          await showDialog(
            context: context!,
            useSafeArea: true,
            builder: (context) => Container(
              height: 50.0,
              width: 50.0,
              color: Colors.white,
              child: ElevatedButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
          return false;
        },
        hideNavigationBar: _hideNavBar,
        decoration: const NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property
      ),
    );
  }
}
