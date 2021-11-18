import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';

class TanyaDokter extends StatefulWidget {
  const TanyaDokter({Key? key}) : super(key: key);

  @override
  State<TanyaDokter> createState() => _TanyaDokterState();
}

class _TanyaDokterState extends State<TanyaDokter> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/homePage');
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Tanya Dokter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.history),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(kDefaultPadding, 95),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: 5),
                  height: 54,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.05,
                    ),
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
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [
          Stack(
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/tanyagratis');
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding, vertical: 10),
                          height: 120,
                          child: Row(
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  'assets/images/doktergratis.png',
                                  width: 80,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: kDefaultPadding,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Tanya Dokter Gratis\n\n",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: mPrimaryColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "Konsultasi saat isoman atau \nkondisi kesehatan lainnya",
                                            style: TextStyle(
                                              letterSpacing: 0.3,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: mSecondaryTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.45,
                              color: mPrimaryColor,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 8),
                                spreadRadius: 2,
                                blurRadius: 4,
                                color: mPrimaryColor.withOpacity(0.15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
