import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sehatq/screen/keranjang_kosong.dart';

import '../constant.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final dataKeranjang = FirebaseDatabase.instance.reference();
    return Scaffold(
        bottomNavigationBar: Container(
          height: 85,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Total Tagihan',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text('Rp 26.500',
                        style: TextStyle(
                            color: mPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))
                  ],
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: mPrimaryColor,
                  ),
                  child: Text('Beli',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
          ),
          elevation: 0,
          backgroundColor: mPrimaryColor,
          title: Text(
            "Keranjang".toUpperCase(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            icon: Icon(
              Icons.arrow_back,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: 10, horizontal: kDefaultPadding),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                StreamBuilder(
                  stream: dataKeranjang.child('keranjang').orderByKey().onValue,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    final tilesList = <ListTile>[];
                    if (snapshot.hasData) {
                      final keranjangList = Map<String, dynamic>.from(
                          (snapshot.data! as Event).snapshot.value);
                      keranjangList.forEach((key, value) {
                        final isiKeranjang = Map<String, dynamic>.from(value);
                        final keranjangTile = ListTile(
                          title: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    margin: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.grey)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        ClipRRect(
                                          child: CachedNetworkImage(
                                            imageUrl: isiKeranjang['foto2'],
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          width: 110,
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: isiKeranjang['nama2'],
                                                  style: TextStyle(
                                                    letterSpacing: 0,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: mSecondaryTextColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ClipRRect(
                                        child: CachedNetworkImage(
                                          imageUrl: isiKeranjang['foto1'],
                                          height: 100,
                                          width: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: isiKeranjang['nama'],
                                                    style: TextStyle(
                                                      letterSpacing: 0,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color:
                                                          mSecondaryTextColor,
                                                    ),
                                                  ),
                                                  TextSpan(text: '\n\n'),
                                                  TextSpan(
                                                    text: isiKeranjang['harga'],
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: mPrimaryColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: kDefaultPadding),
                                        child: Column(
                                          children: [
                                            OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  backgroundColor:
                                                      mSecondaryColor,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              KeranjangKosong()));
                                                },
                                                child: Text(
                                                  'Hapus',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                            Text(
                                              'Jumlah:',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5),
                                              height: 30,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: mPrimaryColor)),
                                              child: Center(
                                                  child: Text(
                                                '1',
                                                style: TextStyle(fontSize: 18),
                                              )),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                        tilesList.add(keranjangTile);
                      });
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.25),
                                width: 1)),
                        child: Column(
                          children: [
                            Container(),
                            ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: tilesList,
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    /*Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                              'assets/images/keranjang_kosong.svg'),
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
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ));*/
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
