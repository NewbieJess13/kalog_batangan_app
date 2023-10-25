import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ionicons/ionicons.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(),
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

        setState(() {});
      },
      type: BottomNavigationBarType.fixed,
      items: [
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
