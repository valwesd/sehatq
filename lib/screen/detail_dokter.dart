import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class DetailDokter extends StatefulWidget {
  final String dokFoto;
  final String dokSpesialis;
  final String dokNama;
  final String dokHarga;
  const DetailDokter({
    Key? key,
    required this.dokFoto,
    required this.dokHarga,
    required this.dokNama,
    required this.dokSpesialis,
  }) : super(key: key);

  @override
  State<DetailDokter> createState() => _DetailDokterState();
}

class _DetailDokterState extends State<DetailDokter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 85,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 5),
          padding:
              EdgeInsets.symmetric(vertical: 2, horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: mPrimaryColor,
                  ),
                  child: Text('Tanya Dokter',
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
            widget.dokNama.toUpperCase(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            icon: Icon(
              Icons.arrow_back,
              size: 40,
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/buatJanji');
            },
          ),
          actions: [],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: widget.dokFoto,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.dokNama + '\n',
                    style: TextStyle(
                        color: mSecondaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    widget.dokSpesialis + '\n',
                    style: TextStyle(
                        color: mSecondaryTextColor.withOpacity(0.75),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    widget.dokHarga,
                    style: TextStyle(
                        color: mPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
