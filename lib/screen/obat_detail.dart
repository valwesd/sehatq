import 'package:cached_network_image/cached_network_image.dart';
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
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Keranjang()));
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
        elevation: 0,
        backgroundColor: mPrimaryColor,
        title: Text(
          widget.namaObat,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
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
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Keranjang()));
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 40,
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
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
                        horizontal: 15,
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
                      padding: EdgeInsets.only(left: 12),
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
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 17, vertical: 10),
                            height: 60,
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
                                Text('$count'),
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
}
