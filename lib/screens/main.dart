import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kalog_batangan_app/features/earthquake_events/views/earthquake_event.dart';
import 'package:kalog_batangan_app/features/evac_centers/views/evac_center_map.dart';
import 'package:kalog_batangan_app/screens/news_feed.dart';
import 'package:kalog_batangan_app/screens/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.child});
  static get routeName => 'main_screen';
  static get routeLocation => '/main_screen';

  final Widget? child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Widget> pages = [
    EarthquakeEventPage(),
    EvacuationCenterMapPage(),
    NewsFeedPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: _bottomNavbar(),
    );
  }

  Widget _bottomNavbar() {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: _selectedIndex,
      unselectedLabelStyle: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red),
      selectedLabelStyle: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red),
      onTap: (value) {
        _selectedIndex = value;

        // switch (value) {
        //   case 0:
        //     context.go(EarthquakeEventPage.routeLocation);

        //     break;
        //   case 1:
        //     context.go(EvacuationCenterMapPage.routeLocation);

        //     break;
        //   case 2:
        //     context.go(NewsFeedPage.routeLocation);

        //     break;
        //   case 3:
        //     context.go(ProfilePage.routeLocation);

        //     break;
        //   default:
        //     0;
        // }

        setState(() {});
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            label: 'Events',
            icon: Icon(
              Ionicons.pulse_outline,
            )),
        BottomNavigationBarItem(
            label: 'Centers',
            icon: Icon(
              Ionicons.home_outline,
            )),
        BottomNavigationBarItem(
            label: 'Feed',
            icon: Icon(
              Ionicons.newspaper_outline,
            )),
        BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Ionicons.person_outline,
            ))
      ],
    );
  }
}
