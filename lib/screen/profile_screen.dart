import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehatq/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mPrimaryColor,
        title: Text(
          "Profil Saya",
          style: TextStyle(
              color: mPrimaryTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                size: 40,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(13),
                    bottomRight: Radius.circular(13),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 4,
                      color: mPrimaryColor.withOpacity(0.15),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 5,
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 130,
                        color: Colors.grey.withOpacity(0.50),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 137,
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: user.displayName! + '\n',
                              style: TextStyle(
                                  color: mSecondaryTextColor.withOpacity(0.75),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: user.email,
                              style: TextStyle(
                                height: 1.5,
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 64,
                      left: 125,
                      child: Container(
                        height: 50,
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '24',
                                    style: TextStyle(
                                      color: mPrimaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Usia',
                                    style: TextStyle(
                                      color:
                                          mSecondaryTextColor.withOpacity(0.75),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '24',
                                    style: TextStyle(
                                      color: mPrimaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Tinggi',
                                    style: TextStyle(
                                      color:
                                          mSecondaryTextColor.withOpacity(0.75),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '24',
                                    style: TextStyle(
                                      color: mPrimaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Berat',
                                    style: TextStyle(
                                      color:
                                          mSecondaryTextColor.withOpacity(0.75),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 110,
                      left: 140,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            elevation: 0,
                            primary: mPrimaryColor,
                            side: BorderSide(color: mPrimaryColor)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/editProfile');
                        },
                        child: Text(
                          'Ubah Profil',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 15, vertical: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: size.height * 0.28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(
                    color: Colors.grey,
                    width: .3,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 4,
                      color: mPrimaryColor.withOpacity(0.15),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/profile_family_profile.svg',
                            height: 40,
                          ),
                          SizedBox(width: 30),
                          Text(
                            'Keluarga',
                            style: TextStyle(
                                color: mSecondaryTextColor.withOpacity(0.75),
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      margin: EdgeInsets.fromLTRB(8, 10, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/profile_activity_profile.svg',
                            height: 40,
                          ),
                          SizedBox(width: 32),
                          Text(
                            'Aktivitas',
                            style: TextStyle(
                                color: mSecondaryTextColor.withOpacity(0.75),
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/profile_transaction_profile.svg',
                            height: 40,
                          ),
                          SizedBox(width: 30),
                          Text(
                            'Transaksi',
                            style: TextStyle(
                                color: mSecondaryTextColor.withOpacity(0.75),
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/profile_phr_profile.svg',
                            height: 40,
                          ),
                          SizedBox(width: 30),
                          Text(
                            'Catatan Kesehatan',
                            style: TextStyle(
                                color: mSecondaryTextColor.withOpacity(0.75),
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: size.height * 0.30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(
                    color: Colors.grey,
                    width: .3,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 4,
                      color: mPrimaryColor.withOpacity(0.15),
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Protokol lengkap\nCovid-19',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: mSecondaryTextColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text:
                                          '\n\nDari pencegahan sampai\npenanganan jika terinfeksi,\nbisa kamu baca disini.',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: mSecondaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/images/profile_empty_general.svg',
                              height: 125,
                            ),
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: mPrimaryColor,
                                minimumSize: Size(size.width, 45)),
                            onPressed: () {},
                            child: Text('Download Pdf'))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
