import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehatq/screen/home_screen.dart';

import '../constant.dart';

class DataTunggu extends StatelessWidget {
  const DataTunggu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mPrimaryColor,
          title: Text(""),
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20),
            icon: Icon(Icons.arrow_back, size: 40),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset('assets/images/tunggu.svg'),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Data Kamu sudah dimasukkan ke antrian\nSilahkan kembali ke Beranda',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: mSecondaryTextColor.withOpacity(0.75)),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: mPrimaryColor,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(),
                  ),
                );
              },
              child: Text(
                'Kembali ke Beranda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        )));
  }
}
