import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';
import 'package:sehatq/screen/beli_obat.dart';
import 'package:sehatq/screen/buat_janji.dart';
import 'package:sehatq/screen/dokter_page.dart';
import 'package:sehatq/screen/keranjang.dart';
import 'package:sehatq/screen/profile_screen.dart';
import 'package:sehatq/screen/tanya_dokter.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda\n'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: 'Tanya\nDokter'),
          BottomNavigationBarItem(
              icon: Icon(Icons.medication), label: 'Beli Obat\n'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profil\n'),
        ],
        currentIndex: currentindex,
        onTap: onTapped,
        iconSize: 40,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: mSecondaryTextColor.withOpacity(0.65),
        selectedItemColor: mPrimaryColor,
        unselectedFontSize: 16,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedFontSize: 18,
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
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 3,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/coba.png',
                                height: 80,
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ActionChip(
                                    backgroundColor:
                                        mPrimaryColor.withOpacity(0.40),
                                    label: Text('Keranjang',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: mSecondaryTextColor,
                                        )),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Keranjang()));
                                    },
                                    avatar: Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 30,
                                      color: mSecondaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.pushNamed(context, '/profil');
                      //   },
                      //   child: Container(
                      //     height: 80,
                      //     decoration: BoxDecoration(color: Colors.transparent),
                      //     child: Stack(children: [
                      //       Positioned(
                      //         top: 5,
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text(
                      //               'Hai,\n' + user.displayName!,
                      //               style: TextStyle(
                      //                 fontSize: 22,
                      //                 color: mPrimaryTextColor,
                      //                 height: 1.5,
                      //                 fontWeight: FontWeight.bold,
                      //                 letterSpacing: 1.5,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       Positioned(
                      //         top: 15,
                      //         left: 250,
                      //         child: Text(
                      //           'Lihat Profil',
                      //           style: TextStyle(
                      //             color: mPrimaryTextColor,
                      //             fontStyle: FontStyle.italic,
                      //           ),
                      //         ),
                      //       )
                      //     ]),
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
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
                                fontSize: 18, color: mSecondaryTextColor),
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
                              EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: <Widget>[
                            CategoryMenu(
                              imgSrc: "assets/images/konsul.png",
                              judul: "Tanya Dokter",
                              press: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TanyaDokter()));
                              },
                            ),
                            CategoryMenu(
                              imgSrc: "assets/images/obat.png",
                              judul: "Beli Obat",
                              press: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BeliObat()));
                              },
                            ),
                            CategoryMenu(
                              imgSrc: "assets/images/janji.png",
                              judul: "Buat Janji",
                              press: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BuatJanji()));
                              },
                            ),
                            CategoryMenu(
                              imgSrc: "assets/images/dokter_1.png",
                              judul: "Dokter",
                              press: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DokterScreen()));
                              },
                            ),
                            CategoryMenu(
                              imgSrc: "assets/images/artkel.png",
                              judul: "Artikel",
                              press: () {},
                            ),
                            CategoryMenu(
                              imgSrc: "assets/images/rs.png",
                              judul: "Rumah Sakit",
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
