import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';

class KeranjangKosong extends StatelessWidget {
  const KeranjangKosong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
          ),
          elevation: 0,
          backgroundColor: mPrimaryColor,
          title: Text("Keranjang",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
              child: SvgPicture.asset('assets/images/keranjang_kosong.svg'),
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Center(
                child: Text(
                  'Keranjang belanja anda masih kosong'.toUpperCase(),
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
                Navigator.popAndPushNamed(context, '/beliObat');
              },
              child: Text(
                'Belanja Sekarang',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        )));
  }
}
