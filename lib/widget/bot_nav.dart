import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';
import 'package:sehatq/screen/beli_obat.dart';
import 'package:sehatq/screen/home_screen.dart';
import 'package:sehatq/screen/profile_screen.dart';
import 'package:sehatq/screen/tanya_dokter.dart';
//import 'package:sehatq/icons.dart';

class BotNav extends StatefulWidget {
  @override
  _BotNavState createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  int currentindex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      currentindex = index;
    });
    pageController.jumpToPage(index);
  }

  int index = 0;
  final screens = [
    HomeScreen(),
    TanyaDokter(),
    BeliObat(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Tanya Dokter'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Beli Obat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined), label: 'Profil'),
          ],
          currentIndex: currentindex,
          onTap: onTapped,
          iconSize: 25,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey[400],
          selectedItemColor: mPrimaryColor,
          unselectedFontSize: 14,
          selectedFontSize: 16,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
        ),
      );
}
