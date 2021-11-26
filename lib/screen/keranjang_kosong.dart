import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';

class KeranjangKosong extends StatelessWidget {
  const KeranjangKosong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mPrimaryColor,
          title: Text("Keranjang",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          leading: IconButton(
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
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Keranjang belanja anda masih kosong',
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
