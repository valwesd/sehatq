import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sehatq/constant.dart';
import 'package:sehatq/screen/detail_dokter.dart';
import 'package:sehatq/screen/keranjang.dart';

class TanyaDokter extends StatefulWidget {
  const TanyaDokter({Key? key}) : super(key: key);

  @override
  State<TanyaDokter> createState() => _TanyaDokterState();
}

class _TanyaDokterState extends State<TanyaDokter> {
  PageController pageController = PageController();
  final _dataDokter = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          elevation: 5,
          backgroundColor: mPrimaryColor,
          onPressed: () {},
          label: Text(
            'Pilih Spesialisasi',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: mPrimaryTextColor),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
          ),
          elevation: 0,
          backgroundColor: mPrimaryColor,
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 40,
            ),
          ),
          title: Text(
            'Tanya Dokter'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: kDefaultPadding),
              child: ActionChip(
                backgroundColor: mPrimaryColor.withOpacity(0.40),
                label: Text('Riwayat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: mSecondaryTextColor,
                    )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Keranjang()));
                },
                avatar: Icon(
                  Icons.history,
                  size: 30,
                  color: mSecondaryTextColor,
                ),
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
                        hintStyle:
                            TextStyle(fontSize: 18, color: mSecondaryTextColor),
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
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: kDefaultPadding),
                        child: Text(
                          "Tanya Dokter Gratis Disini",
                          style: TextStyle(
                            color: mSecondaryTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: kDefaultPadding, vertical: 10),
                        height: 120,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/tanyaGratis');
                            },
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
                                Container(
                                  width: 251,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: kDefaultPadding,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "Tanya Dokter Gratis Disini\n\n",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: mPrimaryColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                              "Konsultasi saat isoman atau \n",
                                          style: TextStyle(
                                            letterSpacing: 0.3,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: mSecondaryTextColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "kondisi kesehatan lainnya",
                                          style: TextStyle(
                                            height: 1.5,
                                            letterSpacing: 0.3,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: mSecondaryTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
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
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Dokter Tersedia",
                                style: TextStyle(
                                  color: mSecondaryTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  primary: mPrimaryColor,
                                  backgroundColor: mPrimaryTextColor,
                                  side: BorderSide(color: mPrimaryColor),
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(height: 15),
                      StreamBuilder(
                        stream: _dataDokter
                            .child('dokter_tanya')
                            .orderByKey()
                            .onValue,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          final tilesList = <ListTile>[];
                          if (snapshot.hasData) {
                            final dokterList = Map<String, dynamic>.from(
                                (snapshot.data! as Event).snapshot.value);
                            dokterList.forEach((key, value) {
                              final infoDokter =
                                  Map<String, dynamic>.from(value);
                              final dokterTile = ListTile(
                                title: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => DetailDokter(
                                                dokFoto: infoDokter['gambar'],
                                                dokHarga: infoDokter['harga'],
                                                dokNama: infoDokter['nama'],
                                                dokSpesialis:
                                                    infoDokter['spesialis'])));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: kDefaultPadding),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: Colors.grey)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 200,
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
                                                      text: infoDokter['nama'],
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            mSecondaryTextColor,
                                                      ),
                                                    ),
                                                    TextSpan(text: '\n\n'),
                                                    TextSpan(
                                                      text: infoDokter[
                                                          'spesialis'],
                                                      style: TextStyle(
                                                        height: 0.4,
                                                        letterSpacing: 0.3,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: mPrimaryColor,
                                                      ),
                                                    ),
                                                    TextSpan(text: '\n'),
                                                    TextSpan(
                                                      text: "SehatQ",
                                                      style: TextStyle(
                                                        height: 2,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            mSecondaryTextColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.medical_services,
                                                    color: mPrimaryColor,
                                                    size: 15,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    infoDokter['pengalaman'],
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                infoDokter['harga'],
                                                style: TextStyle(
                                                    color: mPrimaryColor,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: CachedNetworkImage(
                                            imageUrl: infoDokter['gambar'],
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              tilesList.add(dokterTile);
                            });
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.25),
                                      width: 1)),
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: tilesList,
                              ),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
