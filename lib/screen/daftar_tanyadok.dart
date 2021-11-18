import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';

class TanyaGratis extends StatefulWidget {
  const TanyaGratis({Key? key}) : super(key: key);

  @override
  State<TanyaGratis> createState() => _TanyaGratisState();
}

class _TanyaGratisState extends State<TanyaGratis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/tanyaDok');
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Daftar Konsultasi',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: kDefaultPadding),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          letterSpacing: 0.1,
                          fontSize: 12,
                        ),
                        children: [
                          TextSpan(
                            text: "Silahkan baca",
                            style: TextStyle(
                              color: mSecondaryTextColor,
                            ),
                          ),
                          TextSpan(
                            text: " Disclaimer",
                            style: TextStyle(
                              color: mPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                " kami sebelum memulai konsultasi\nWaktu konsultasinya ",
                            style: TextStyle(
                              color: mSecondaryTextColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: "30 menit",
                            style: TextStyle(
                              color: mPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ", ya",
                            style: TextStyle(
                              color: mSecondaryTextColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: "\n\nKamu konsultasi untuk siapa?",
                            style: TextStyle(
                              fontSize: 14,
                              color: mSecondaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: kDefaultPadding),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: mPrimaryColor,
                      ),
                    ),
                    child: FittedBox(
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.grey,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: 10, left: kDefaultPadding * 1.5),
                    child: Text(
                      "Saya",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: mPrimaryColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Keluhan Saya...",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding, vertical: 5),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 0.45,
                            color: Colors.grey,
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText:
                                "Gejala, durasi, dan tindakan yang sudah dilakukan",
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "Tanggal Lahir",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding, vertical: 5),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 0.45,
                            color: Colors.grey,
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Batuk berdahak, ruam, migraine",
                            hintStyle:
                                TextStyle(fontSize: 16, color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "Nomor Handphone",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding, vertical: 5),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 0.45,
                            color: Colors.grey,
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Batuk berdahak, ruam, migraine",
                            hintStyle:
                                TextStyle(fontSize: 16, color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Text(
                        "Jenis Kelamin",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding, vertical: 5),
                        height: 54,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 0.45,
                            color: Colors.grey,
                          ),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Batuk berdahak, ruam, migraine",
                            hintStyle:
                                TextStyle(fontSize: 16, color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
