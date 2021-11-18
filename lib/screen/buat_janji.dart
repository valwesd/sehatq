import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';

class BuatJanji extends StatelessWidget {
  const BuatJanji({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mPrimaryColor,
        title: Text("Buat Janji"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/homePage');
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: 5),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      spreadRadius: 0,
                      blurRadius: 5,
                      color: mSecondaryTextColor.withOpacity(0.15),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Ketik disini untuk mencari dokter",
                    hintStyle: TextStyle(
                        fontSize: 17,
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
              Container(
                height: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      spreadRadius: 2,
                      blurRadius: 5,
                      color: mSecondaryTextColor.withOpacity(0.15),
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
