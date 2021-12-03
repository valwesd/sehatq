import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sehatq/screen/keranjang.dart';

import '../constant.dart';

class ObatDetail extends StatefulWidget {
  final String fotoObat, namaObat, hargaObat;
  const ObatDetail(
      {Key? key,
      required this.fotoObat,
      required this.hargaObat,
      required this.namaObat})
      : super(key: key);

  @override
  State<ObatDetail> createState() => _ObatDetailState();
}

class _ObatDetailState extends State<ObatDetail> {
  int count = 0;
  final _dataApotek = FirebaseDatabase.instance.reference();
  void _tambahItem() {
    setState(() {
      count++;
    });
  }

  void _kurangItem() {
    if (count <= 0) {
      return;
    }
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: 110,
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: kDefaultPadding),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 50,
              decoration: BoxDecoration(
                color: mSecondaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => buildSheet(),
                  ),
                  child: Center(
                    child: Text(
                      'Tambahkan Ke Keranjang',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: mPrimaryColor, width: 1)),
              width: size.width,
              height: 50,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Text(
                      'Beli Sekarang',
                      style: TextStyle(
                          color: mPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
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
          widget.namaObat.toUpperCase(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          icon: Icon(
            Icons.arrow_back,
            size: 40,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/beliObat');
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: kDefaultPadding),
            child: ActionChip(
              backgroundColor: mPrimaryColor.withOpacity(0.40),
              label: Text('Keranjang',
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
                Icons.shopping_cart_outlined,
                size: 30,
                color: mSecondaryTextColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: widget.fotoObat,
                        height: size.width,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                      ),
                      child: Text(
                        widget.namaObat,
                        style: TextStyle(
                          letterSpacing: .5,
                          color: mSecondaryTextColor.withOpacity(0.75),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: kDefaultPadding),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              width: 1, color: Colors.grey.withOpacity(0.55)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: mSecondaryColor.withOpacity(0.55),
                          ),
                          Text(
                            '4,4',
                            style: TextStyle(
                              color: mSecondaryTextColor.withOpacity(0.75),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: kDefaultPadding),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mulai dari',
                                style: TextStyle(
                                  color: mSecondaryTextColor.withOpacity(0.55),
                                  letterSpacing: 1,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 10),
                                height: 45,
                                alignment: Alignment.bottomLeft,
                                color: Colors.white,
                                child: Text(
                                  widget.hargaObat,
                                  style: TextStyle(
                                    color: mPrimaryColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: mPrimaryColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _kurangItem();
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 20,
                                    )),
                                Text(
                                  '$count',
                                  style: TextStyle(fontSize: 18),
                                ),
                                IconButton(
                                    onPressed: () {
                                      _tambahItem();
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 20,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    /*Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Container(
                            width: size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: mSecondaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Keranjang()));
                                },
                                child: Center(
                                  child: Text(
                                    'Tambahkan Ke Keranjang',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: mPrimaryColor, width: 1)),
                            width: size.width,
                            height: 50,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    'Beli Sekarang',
                                    style: TextStyle(
                                        color: mPrimaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSheet() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Pilih Apotek'.toUpperCase(),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: mSecondaryTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _dataApotek.child('apotek').orderByKey().onValue,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            final tilesList = <ListTile>[];
            if (snapshot.hasData) {
              CircularProgressIndicator();
              final obatList = Map<String, dynamic>.from(
                  (snapshot.data! as Event).snapshot.value);
              obatList.forEach((key, value) {
                final infoObat = Map<String, dynamic>.from(value);
                final obatTile = ListTile(
                  title: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Keranjang()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              imageUrl: infoObat['foto'],
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: infoObat['nama'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: mSecondaryTextColor,
                                        ),
                                      ),
                                      TextSpan(text: '\n\n'),
                                      TextSpan(
                                        text: infoObat['harga'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: mPrimaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                tilesList.add(obatTile);
              });
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.25), width: 1)),
                child: ListView(
                  padding: EdgeInsets.all(5),
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
      ),
    );
  }
}
