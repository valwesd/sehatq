import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehatq/constant.dart';
import 'package:sehatq/screen/beli_obat.dart';
import 'package:sehatq/screen/profile_screen.dart';
import 'package:sehatq/screen/tanya_dokter.dart';
//import 'package:sehatq/icons.dart';
//import 'package:sehatq/constant.dart';
//import 'package:sehatq/screen/splash/body.dart';
import 'package:sehatq/widget/category_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      currentindex = index;
    });
    pageController.jumpToPage(index);
  }

  final screens = [
    HomeScreen(),
    TanyaDokter(),
    BeliObat(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Tanya Dokter'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Beli Obat'),
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
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: size.height * .45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topLeft,
                        image: AssetImage("assets/images/background.png")),
                    color: mPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/images/logo.svg',
                              height: 50,
                            ),
                            ActionChip(
                                label: Text(''),
                                avatar: Icon(Icons.shopping_cart),
                                onPressed: () {})
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Halo\n' + user.displayName!,
                        style: TextStyle(
                          fontSize: 22,
                          color: mPrimaryTextColor,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding, vertical: 5),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 8),
                              blurRadius: 5,
                              color: mSecondaryTextColor.withOpacity(0.15),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Ketik disini untuk mencari....",
                            hintStyle: TextStyle(
                                fontSize: 18,
                                color: mSecondaryTextColor.withOpacity(0.90)),
                            suffixIcon: Icon(
                              Icons.search,
                              size: 30,
                              color: mSecondaryTextColor,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.count(
                          padding:
                              EdgeInsets.symmetric(horizontal: 1, vertical: 5),
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: <Widget>[
                            CategoryMenu(
                              imgSrc: "assets/images/Tanyadok.png",
                              judul: "Tanya Dokter",
                              press: () {
                                Navigator.pushNamed(context, '/tanyaDok');
                              },
                            ),
                            CategoryMenu(
                              imgSrc: "assets/images/obat.png",
                              judul: "Beli Obat",
                              press: () {
                                Navigator.pushNamed(context, '/beliObat');
                              },
                            ),
                            CategoryMenu(
                              imgSrc: "assets/images/Date.png",
                              judul: "Buat Janji",
                              press: () {
                                Navigator.pushNamed(context, '/buatJanji');
                              },
                            ),
                            CategoryMenu(
                              imgSrc: "assets/images/Artikel.png",
                              judul: "Artikel",
                              press: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          TanyaDokter(),
          BeliObat(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
